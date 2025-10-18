module FPL
  class Meta
    def initialize
      @fpl_api_response = JSON.parse(Faraday.get(bootstrap_url).body)
    end

    def get_current_gameweek
      fpl_api_response["events"].find { |event| event["is_current"] }
    end

    def gameweek_is_finished?
      get_current_gameweek["finished"]
    end

    def today_is_deadline_day_for_week_number
      deadlines = fpl_api_response["events"].map { |event| [ event["id"], event["deadline_time"]&.to_datetime ] }
      deadlines.find { |_, deadline| deadline.today? }&.first
    end

    def deadline_for_week_number(week_number)
      fpl_api_response["events"].find { |event| event["id"] == week_number }["deadline_time"]&.to_datetime
    end

    def next_gameweek
      fpl_api_response["events"].find { |event| event["is_next"] }
    end

    def next_deadline
      fpl_api_response["events"].find { |event| event["is_next"] }["deadline_time"]
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
