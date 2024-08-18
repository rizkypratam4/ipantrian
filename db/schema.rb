# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_17_034901) do
  create_table "productions", force: :cascade do |t|
    t.boolean "status_production"
    t.datetime "tanggal_selesai"
    t.integer "wo_list_id", null: false
    t.boolean "reschedule"
    t.datetime "reschedule_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wo_list_id"], name: "index_productions_on_wo_list_id"
  end

  create_table "wo_lists", force: :cascade do |t|
    t.string "nama_barang_1"
    t.string "nama_barang_2"
    t.integer "quantity"
    t.integer "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
  end

  add_foreign_key "productions", "wo_lists"
end
