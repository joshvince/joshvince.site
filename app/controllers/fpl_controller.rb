# frozen_string_literal: true

class FPLController < ApplicationController
  layout "info"

  def index
    @page_title = "FPL Bet | Josh Vince"
    @players = FPL::Players.fetch_players(manager_count: 50)
  end
end
