class CreateFPLGameweeks < ActiveRecord::Migration[8.0]
  def change
    create_table :fpl_gameweeks do |t|
      t.integer :gameweek
      t.timestamp :deadline
      t.jsonb :bets

      t.timestamps
    end
  end
end
