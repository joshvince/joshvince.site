class AddJobToProjects < ActiveRecord::Migration[7.0]
  def change
    change_table :projects do |t|
      t.boolean :job
    end
  end
end
