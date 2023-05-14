class CreateConversations < ActiveRecord::Migration[7.0]
  def change

    create_table :conversations do |t|
      t.sender_id :integer, null: false
      t.recipient_id :integer, null: false
      t.timestamps

      
    end
  end
end
