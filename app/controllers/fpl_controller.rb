# frozen_string_literal: true

class FPLController < ApplicationController
  layout "info"

  def index
    @page_title = "FPL Bet | Josh Vince"
    @gameweeks = FPLGameweek.all.pluck(:gameweek).sort
  end

  def show
    @gameweek = FPLGameweek.find_by(gameweek: params[:gameweek])
    @page_title = "FPL Bet | Gameweek #{@gameweek.gameweek}"

    render "fpl/gameweek_bets", layout: false
  end
end
