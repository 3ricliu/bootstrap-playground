class ChangeUserIdFormatInPostsTable < ActiveRecord::Migration
  def change
    change_column :posts, :user_id, 'integer USING CAST(user_id AS integer)'
  end
end
