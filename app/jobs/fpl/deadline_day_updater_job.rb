module FPL
  class DeadlineDayUpdaterJob < ApplicationJob
    class GameweekNotYetLiveError < StandardError; end

    retry_on StandardError, wait: 30.seconds, attempts: 2
    retry_on ActiveRecord::RecordNotFound, wait: 30.seconds, attempts: 2
    retry_on GameweekNotYetLiveError, wait: 10.minutes, attempts: 7

    def perform
      @meta = Meta.new
      @next_deadline = @meta.next_deadline.to_datetime

      return unless @next_deadline.today?

      @this_week = FPLGameweek.find_by(gameweek: @meta.get_current_gameweek["id"])
      return if this_week_bets_already_in_db?

      update_bets!
    end

    def update_bets!
      bets = FPL::GenerateBets.call(meta: @meta)
      @this_week.update!(bets:)

    rescue StandardError
      # Assume that any issues trying to parse the picks are because the data is not yet live.
      raise GameweekNotYetLiveError
    end

    def this_week_bets_already_in_db?
      !@this_week.bets.nil?
    end
  end
end
