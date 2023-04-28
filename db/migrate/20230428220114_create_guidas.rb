class CreateGuidas < ActiveRecord::Migration[7.0]
  def change
    create_table :guidas do |t|
      t.string :email
      t.integer :followers
      t.integer :rating
      t.integer :visits
      t.string :lingue
      t.text :descrizione
      t.timestamps
    end
  end
end
