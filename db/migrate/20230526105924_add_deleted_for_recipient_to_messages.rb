class AddDeletedForRecipientToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :deleted_for_recipient, :boolean, default: false, null: false
  end
end
