module FPL
  class Player
    def self.from_db_value(hash)
      new(
        fpl_player: hash.deep_stringify_keys,
        team: hash["team"],
        player_type: hash["player_type"],
        weight: hash["weight"]
      )
    end

    def self.from_api_value(api_hash:, weight:, meta:)
      target_hash = {
        "name" => api_hash["web_name"],
        "xg" => api_hash["expected_goals_per_90"],
        "xa" => api_hash["expected_assists_per_90"],
        "clean_sheets" => api_hash["clean_sheets_per_90"],
        "saves" => api_hash["saves_per_90"]
      }

      new(
        fpl_player: target_hash,
        team: meta.teams[api_hash["team"]],
        player_type: meta.element_type_names[api_hash["element_type"]],
        weight:
      )
    end

    def initialize(fpl_player:, team:, player_type:, weight:)
      @fpl_player = fpl_player

      @name = fpl_player["name"]
      @team = team
      @player_type = player_type
      @weight = weight
      @xg = fpl_player["xg"].to_f
      @xa = fpl_player["xa"].to_f
      @clean_sheets = fpl_player["clean_sheets"].to_f
      @saves = fpl_player["saves"].to_f
    end

    attr_reader :name, :team, :player_type, :weight, :xg, :xa, :clean_sheets, :saves

    def bets
      case player_type
      when "Goalkeeper"
        goalkeeper_bets
      when "Defender"
        defender_bets
      when "Midfielder"
        midfielder_bets
      when "Forward"
        forward_bets
      end
    end

    def to_h
      {
        name:,
        team:,
        player_type:,
        weight:,
        xg:,
        xa:,
        clean_sheets:,
        saves:
      }
    end

    private

    attr_reader :fpl_player

    def goalkeeper_bets
      [ clean_sheet_bet, saves_bet ]
    end

    def defender_bets
      bets = []
      bets << clean_sheet_bet if clean_sheets > 0.25
      bets << goal_involvement_bet if xg > 0.20 || xa > 0.20

      bets
    end

    def midfielder_bets
      bets = []
      bets << clean_sheet_bet if clean_sheets > 0.25
      bets << goal_involvement_bet if xg > 0.25 || xa > 0.25

      bets
    end

    def forward_bets
      bets = [ score_bet ]
      bets << assist_bet if xa > 0.25

      bets
    end

    def clean_sheet_bet
      "#{team} to keep a clean sheet (#{clean_sheets} per 90)"
    end

    def saves_bet
      "#{name} to make #{saves.round} saves (#{saves} per 90)"
    end

    def goal_involvement_bet
      "#{name} to get a goal or assist: #{xg} xG / + #{xa} xA per 90"
    end

    def assist_bet
      "#{name} to get an assist: #{xa} xA per 90"
    end

    def score_bet
      "#{name} to score: #{xg} xG per 90"
    end
  end
end
