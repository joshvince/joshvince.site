module FPL
  class Managers
    OVERALL_LEAGUE_ID = 314

    def self.fetch_top_managers(number = 50)
      raise "Number must be less than 50" if number > 50

      new(number).call
    end

    def initialize(number)
      @number = number
    end

    def call
      top_entry_values.take(@number)
    end

    private

    def manager_ranking_url
      "https://fantasy.premierleague.com/api/leagues-classic/#{OVERALL_LEAGUE_ID}/standings/?page_new_entries=1&page_standings=1&phase=1"
    end

    def fpl_api_response
      @fpl_api_response ||= JSON.parse(Faraday.get(manager_ranking_url).body)
    end

    def top_entry_values
      fpl_api_response["standings"]["results"].map { |result| result["entry"] }
    end
  end
end
