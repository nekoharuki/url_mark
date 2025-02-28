class CreateFollows < ActiveRecord::Migration[7.2]
  def change
    create_table :follows do |t|
      t.integer :follower_user
      t.integer :followed_user

      t.timestamps
    end
  end
end
