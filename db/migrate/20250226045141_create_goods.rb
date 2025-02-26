class CreateGoods < ActiveRecord::Migration[7.2]
  def change
    create_table :goods do |t|
      t.integer :url_id
      t.integer :user_id

      t.timestamps
    end
  end
end
