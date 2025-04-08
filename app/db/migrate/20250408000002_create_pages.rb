class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :content
      t.string :description
      t.boolean :published, default: false
      t.boolean :home, default: false

      t.timestamps
    end
    
    add_index :pages, :slug, unique: true
    add_index :pages, :home
  end
end