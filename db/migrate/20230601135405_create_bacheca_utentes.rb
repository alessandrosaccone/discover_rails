class CreateBachecaUtentes < ActiveRecord::Migration[7.0]
  def change
    create_table :bacheca_utentes do |t|
      t.string :descrizione
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
