module FPL
  class Players
    def self.fetch_players(manager_count: 50, meta: Meta.new)
      new(manager_count, meta).call
    end

    def initialize(manager_count, meta)
      @manager_count = manager_count
      @meta = meta
    end

    def call
      most_popular_players(all_players)
    end

    private

    attr_reader :meta

    def current_gameweek
      meta.get_current_gameweek["id"]
    end

    def manager_ids
      @manager_ids ||= Managers.fetch_top_managers(@manager_count)
    end

    def all_players
      @all_players ||= manager_ids.map { |manager_id| fetch_players_for_manager(manager_id) }.flatten
    end

    def fetch_players_for_manager(manager_id)
      url = "https://fantasy.premierleague.com/api/entry/#{manager_id}/event/#{current_gameweek}/picks/"
      picks = JSON.parse(Faraday.get(url).body)["picks"]
      only_active_players(picks)
    end

    # Do not include benched players that are not in a bench boost
    def only_active_players(picks)
      picks.reject { |pick| pick["multiplier"] == 0 }
    end

    def most_popular_players(players)
      grouped_players = players.group_by { |player| player["element_type"] }

      grouped_players.to_h { |element_type, players| [ meta.element_type_names[element_type], players_by_weighted_count(players) ] }
    end

    def players_by_weighted_count(players)
      unsorted = players.each_with_object(Hash.new(0)) do |player, hash|
        # Weight the player by the multiplier - eg captains and triple captains get more
        hash[player["element"]] += player["multiplier"]
      end

      unsorted.map { |player_id, count| convert_json_to_player_data(player_id, count) }
              .sort_by(&:weight).reverse.take(5)
    end

    def convert_json_to_player_data(player_id, weight)
      fpl_player = meta.players.find { |player| player["id"] == player_id }

      Player.from_api_value(api_hash: fpl_player, weight:, meta:)
    end
  end
end
