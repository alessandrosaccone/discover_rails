class AddNewColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :persone_rimanenti, :integer
    reversible do |dir|
      dir.up { Post.update_all('persone_rimanenti = persone') }
    end
  end
end
