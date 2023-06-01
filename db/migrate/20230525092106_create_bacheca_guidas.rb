class CreateBachecaGuidas < ActiveRecord::Migration[7.0]
  def change
    create_table :bacheca_guidas do |t|
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
