class RemoveUsersColumnFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :users, :string
  end
end
