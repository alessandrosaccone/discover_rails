class RemoveColumnFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :persone_rimanenti, :string
  end
end
