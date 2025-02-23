class AddUrlsMemo < ActiveRecord::Migration[7.2]
  def change
    add_column :urls, :memo, :text
  end
end
