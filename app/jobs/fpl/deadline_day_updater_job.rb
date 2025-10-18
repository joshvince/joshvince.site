module FPL
  class DeadlineDayUpdaterJob < ApplicationJob
    class GameweekNotYetLiveError < StandardError; end

    retry_on StandardError, wait: 30.seconds, attempts: 2
    retry_on ActiveRecord::RecordNotFound, wait: 30.seconds, attempts: 2
    retry_on GameweekNotYetLiveError, wait: 10.minutes, attempts: 7

    def perform
      @meta = Meta.new
      @deadline_week_number = @meta.today_is_deadline_day_for_week_number
      return if @deadline_week_number.blank?

      @deadline = @meta.deadline_for_week_number(@deadline_week_number)

      # This means the deadline has passed but the game was not yet been updated.
      raise GameweekNotYetLiveError if @deadline < Time.zone.now


      @this_week = FPLGameweek.find_by(gameweek: @deadline_week_number)
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
