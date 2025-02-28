class AddFollow < ActiveRecord::Migration[7.2]
  def change
    add_column :follows, :follower_user_id, :integer
    remove_column :follows, :follower_user, :integer
    add_column :follows, :followed_user_id, :integer
    remove_column :follows, :followed_user, :integer
  end
end
