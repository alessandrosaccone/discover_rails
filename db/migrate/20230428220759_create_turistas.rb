class CreateTuristas < ActiveRecord::Migration[7.0]
  def change
    create_table :turistas do |t|
      t.string :email
      t.integer :guide
      t.integer :visits
      t.integer :cittaVis
      t.timestamps
    end
  end
end
