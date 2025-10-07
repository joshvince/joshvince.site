module FPL
  class Player
    def initialize(fpl_player:, weight:, meta:)
      @fpl_player = fpl_player

      @name = fpl_player["web_name"]
      @team = meta.teams[fpl_player["team"]]
      @player_type = meta.element_type_names[fpl_player["element_type"]]
      @weight = weight
      @xg = fpl_player["expected_goals_per_90"].to_f
      @xa = fpl_player["expected_assists_per_90"].to_f
      @clean_sheets = fpl_player["clean_sheets_per_90"].to_f
      @saves = fpl_player["saves_per_90"].to_f
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
