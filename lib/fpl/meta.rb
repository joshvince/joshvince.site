module FPL
  class Meta
    def initialize
      @fpl_api_response = JSON.parse(Faraday.get(bootstrap_url).body)
    end

    def get_current_gameweek
      fpl_api_response["events"].find { |event| event["is_current"] }["id"]
    end

    def element_type_names
      {
        1 => "Goalkeeper",
        2 => "Defender",
        3 => "Midfielder",
        4 => "Forward"
      }
    end

    def players
      fpl_api_response["elements"]
    end

    def teams
      fpl_api_response["teams"].to_h { |team| [ team["id"], team["name"] ] }
    end

    private

    attr_reader :fpl_api_response

    def bootstrap_url
      "https://fantasy.premierleague.com/api/bootstrap-static/"
    end
  end
end
