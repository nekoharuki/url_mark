class AddUrlImage < ActiveRecord::Migration[7.2]
  def change
    add_column :urls, :image, :string
  end
end
