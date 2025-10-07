module FPL
  class DeadlineCheckerJob < ApplicationJob
    retry_on StandardError, wait: 1.hour

    def perform
      @meta = Meta.new
      @next_deadline = @meta.next_deadline.to_datetime

      store_next_week_in_db unless next_week_exists_in_db?

      DeadlineDayUpdaterJob.set(wait_until: deadline_plus_ten_minutes).perform_later if today_is_deadline_day?
    end

    def today_is_deadline_day?
      @next_deadline.today?
    end

    def deadline_plus_ten_minutes
      @next_deadline + 10.minutes
    end

    def next_week_exists_in_db?
      FPLGameweek.where(gameweek: @meta.next_gameweek["id"]).exists?
    end

    def store_next_week_in_db
      FPLGameweek.new(gameweek: @meta.next_gameweek["id"], deadline: @meta.next_deadline, bets: nil).save!
    end
  end
end
