class AddStatusToWoLists < ActiveRecord::Migration[7.1]
  def change
    add_column :wo_lists, :status, :boolean
  end
end
