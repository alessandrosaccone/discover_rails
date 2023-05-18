class AddDeleteForUser < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :deleted_for_user, :boolean, null: false, default: false
  end
end
