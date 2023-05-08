class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :descrizione
      t.string :titolo
      t.timestamp :data
      t.time :ora
      t.string :lingua
      t.integer :persone
      t.integer :prezzo
      t.string :nomeC
      t.string :regioneC
      t.string :nomeP
      t.timestamps
    end
  end
end