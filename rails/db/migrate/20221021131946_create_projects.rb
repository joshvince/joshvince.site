class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :slug, index: { unique: true, name: 'unique_slugs' }
      t.string :name
      t.string :subtitle
      t.jsonb  :description
      t.string :link_1_name
      t.string :link_1
      t.string :link_2_name
      t.string :link_2
      t.timestamps
    end
  end
end
