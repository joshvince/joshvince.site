class AddResultsToBets < ActiveRecord::Migration[8.0]
  def change
    add_column :fpl_gameweeks, :results, :integer, array: true, default: [ 0, 0 ]
    add_column :fpl_gameweeks, :stake, :float, default: 1.0
  end
end
