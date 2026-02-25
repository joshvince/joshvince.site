class AddStandaloneToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :standalone, :boolean, default: false, null: false
    add_column :projects, :standalone_url, :string
    add_column :projects, :published_on, :date
  end
end
