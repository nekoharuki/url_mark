class CreateUrls < ActiveRecord::Migration[7.2]
  def change
    create_table :urls do |t|
      t.string :name
      t.text :url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
