class AddPersoneLastminuteToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :persone_lastminute, :integer
  end
end
