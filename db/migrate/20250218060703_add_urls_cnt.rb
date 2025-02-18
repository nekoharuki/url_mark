class AddUrlsCnt < ActiveRecord::Migration[7.2]
  def change
    add_column :urls, :cnt, :integer
  end
end
