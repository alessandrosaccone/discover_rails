class AddAudioToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :audio, :string, null: true
  end
end
