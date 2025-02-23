class AddUrlsTitle < ActiveRecord::Migration[7.2]
  def change
    add_column :urls, :title, :string
    remove_column :urls, :name, :string
  end
end
