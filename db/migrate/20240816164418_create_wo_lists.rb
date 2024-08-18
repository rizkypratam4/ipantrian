class CreateWoLists < ActiveRecord::Migration[7.1]
  def change
    create_table :wo_lists do |t|
      t.string :nama_barang_1
      t.string :nama_barang_2
      t.integer :quantity
      t.integer :priority

      t.timestamps
    end
  end
end
