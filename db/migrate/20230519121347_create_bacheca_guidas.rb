class CreateBachecaGuidas < ActiveRecord::Migration[7.0]
  def change
    create_table :bacheca_guidas do |t|
      t.string :descrizione
      t.references :guida, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
