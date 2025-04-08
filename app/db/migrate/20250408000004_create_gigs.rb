class CreateGigs < ActiveRecord::Migration[7.0]
  def change
    create_table :gigs do |t|
      t.string :title, null: false
      t.date :date, null: false
      t.time :start_time
      t.time :end_time
      t.string :slug
      t.string :headline
      t.string :subheadline
      t.text :description
      t.decimal :price, precision: 8, scale: 2
      t.string :ticket_url
      t.boolean :published, default: false
      t.references :series, foreign_key: true, null: true

      t.timestamps
    end
    
    add_index :gigs, :slug, unique: true
    add_index :gigs, :date
    add_index :gigs, :published
  end
end