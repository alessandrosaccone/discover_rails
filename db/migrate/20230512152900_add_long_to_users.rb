class AddLongToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :long, :string
  end
end
