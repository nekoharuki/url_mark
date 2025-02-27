class AddUserRemoveChange < ActiveRecord::Migration[7.2]
  def change
    add_column :urls, :explanation, :string
    remove_column :urls, :memo, :string
    add_column :urls, :link, :string
    remove_column :urls, :url, :string
  end
end
