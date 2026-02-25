class CreateJunkFoods < ActiveRecord::Migration[8.0]
  def change
    create_table :junk_foods do |t|
      t.string :name, null: false
      t.jsonb :answers, default: {}

      t.timestamps
    end
  end
end
