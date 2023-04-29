class CreatePosta < ActiveRecord::Migration[7.0]
  def change
    create_table :postas do |t|
      t.string :email
      t.integer :id_posta
      t.timestamps
    end
  end
end

