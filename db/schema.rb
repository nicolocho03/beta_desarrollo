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

ActiveRecord::Schema[7.1].define(version: 2024_06_24_201514) do
  create_table "bills", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "radicado"
    t.string "SAO"
    t.string "numero_factura"
    t.date "fecha_llegada_recepcion"
    t.date "fecha_entrega_compras"
    t.date "fecha_entrega_sst"
    t.date "fecha_entrega_gerencia"
    t.date "fecha_entrega_contabilidad"
    t.bigint "state_gerencia_id"
    t.bigint "state_contabilidad_id"
    t.bigint "state_sst_id"
    t.string "tipo_proyecto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "compras_segunda_fecha"
    t.index ["state_contabilidad_id"], name: "index_bills_on_state_contabilidad_id"
    t.index ["state_gerencia_id"], name: "index_bills_on_state_gerencia_id"
    t.index ["state_sst_id"], name: "index_bills_on_state_sst_id"
  end

  create_table "general_states", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specific_states", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.bigint "ubication_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ubication_id"], name: "index_specific_states_on_ubication_id"
  end

  create_table "ubications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre_usuario"
    t.string "password"
    t.bigint "ubication_id", null: false
    t.bigint "state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_users_on_state_id"
    t.index ["ubication_id"], name: "index_users_on_ubication_id"
  end

  add_foreign_key "bills", "specific_states", column: "state_contabilidad_id"
  add_foreign_key "bills", "specific_states", column: "state_gerencia_id"
  add_foreign_key "bills", "specific_states", column: "state_sst_id"
  add_foreign_key "specific_states", "ubications"
  add_foreign_key "users", "general_states", column: "state_id"
  add_foreign_key "users", "ubications"
end
