class CreateSeries < ActiveRecord::Migration[7.0]
  def change
    create_table :series do |t|
      t.string :name, null: false
      t.string :slug
      t.text :description

      t.timestamps
    end
    
    add_index :series, :name, unique: true
    add_index :series, :slug, unique: true
  end
end