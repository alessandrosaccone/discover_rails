class AddUserEmailToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :user_email, :string
    add_foreign_key :posts, :users, column: :user_email, primary_key: :email
  end
end
