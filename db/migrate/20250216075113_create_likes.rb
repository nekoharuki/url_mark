class CreateLikes < ActiveRecord::Migration[7.2]
  def change
    create_table :likes do |t|
      t.integer :url_id
      t.integer :user_name

      t.timestamps
    end
  end
end
