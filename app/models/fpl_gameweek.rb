class FPLGameweek < ApplicationRecord
  def bets_ordered_by_position
    return {} if bets.blank?

    position_order = {
      "Goalkeeper" => 1,
      "Defender" => 2,
      "Midfielder" => 3,
      "Forward" => 4
    }

    bets.sort_by { |position, _| position_order[position] || 999 }
  end
end
