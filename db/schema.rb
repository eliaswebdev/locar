# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151023130532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string   "nome"
    t.string   "cpf"
    t.string   "fone"
    t.date     "data_nascimento"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
  end

  create_table "locacoes", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "veiculo_id"
    t.float    "valor_diaria"
    t.float    "valor_desconto"
    t.integer  "quilometragem_inicial"
    t.integer  "quilometragem_final"
    t.date     "data_locacao"
    t.date     "data_devolucao"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.date     "data_prevista"
  end

  add_index "locacoes", ["cliente_id"], name: "index_locacoes_on_cliente_id", using: :btree
  add_index "locacoes", ["veiculo_id"], name: "index_locacoes_on_veiculo_id", using: :btree

  create_table "marcas", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "modelos", force: :cascade do |t|
    t.integer  "marca_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "nome"
  end

  create_table "veiculos", force: :cascade do |t|
    t.integer  "modelo_id"
    t.string   "placa"
    t.integer  "quilometragem"
    t.string   "cor"
    t.integer  "ano_fabricacao"
    t.integer  "ano_modelo"
    t.integer  "portas"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "veiculos", ["modelo_id"], name: "index_veiculos_on_modelo_id", using: :btree

  add_foreign_key "locacoes", "clientes"
  add_foreign_key "locacoes", "veiculos"
  add_foreign_key "veiculos", "modelos"
end
