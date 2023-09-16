class AddLastMinuteToPosts < ActiveRecord::Migration[7.0]  # Change the version number if you're on a different Rails version.
  def change
    add_column :posts, :last_minute, :boolean, default: false, null: false
  end
end

