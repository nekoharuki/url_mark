class AddUserEx < ActiveRecord::Migration[7.2]
  def change
    remove_column :urls, :explanation, :text
    add_column :urls, :explanation, :text
  end
end
