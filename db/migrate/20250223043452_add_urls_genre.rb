class AddUrlsGenre < ActiveRecord::Migration[7.2]
  def change
    add_column :urls, :genre, :string
  end
end
