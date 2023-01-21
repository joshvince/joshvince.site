class AddIndexToProjects < ActiveRecord::Migration[7.0]
  def change
    change_table :projects do |t|
      t.integer :index
    end
  end
end
