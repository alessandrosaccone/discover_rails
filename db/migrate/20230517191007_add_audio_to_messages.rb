class AddAudioToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :audio, :binary, null: true
  end
end
