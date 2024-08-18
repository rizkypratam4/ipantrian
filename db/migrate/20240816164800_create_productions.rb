class CreateProductions < ActiveRecord::Migration[7.1]
  def change
    create_table :productions do |t|
      t.boolean :status_production
      t.datetime :tanggal_selesai
      t.references :wo_list, null: false, foreign_key: true
      t.boolean :reschedule
      t.datetime :reschedule_date

      t.timestamps
    end
  end
end
