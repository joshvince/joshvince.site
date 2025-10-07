module FPL
  class GenerateBets
    def self.call(meta: Meta.new)
      new(meta:).call
    end

    def initialize(meta: Meta.new)
      @meta = meta
    end

    def call
      bets = FPL::Players.fetch_players(meta: @meta)

      convert_bets_to_json(bets)
    end

    private

    def convert_bets_to_json(bets)
      bets.to_h { |type, players| [ type, players.map(&:to_h) ] }
    end
  end
end
