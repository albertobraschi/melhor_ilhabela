# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091227221341) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bares_e_boates", :force => true do |t|
    t.integer  "estabelecimento_id"
    t.text     "descricao"
    t.text     "publico_alvo"
    t.text     "forma_pagamento"
    t.text     "horario_atendimento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientes", :force => true do |t|
    t.string   "nome_fantasia"
    t.string   "razao_social"
    t.string   "cnpj_estabelecimento"
    t.string   "ramo_atuacao"
    t.string   "endereco_estabelecimento"
    t.string   "numero_estabelecimento"
    t.string   "complemento_estabelecimento"
    t.string   "cep_estabelecimento"
    t.string   "bairro_estabelecimento"
    t.string   "cidade_estabelecimento"
    t.string   "estado_estabelecimento"
    t.string   "telefone_comercial"
    t.string   "telefone_celular"
    t.string   "telefone_fax"
    t.string   "email_estabelecimento"
    t.string   "nome_responsavel"
    t.string   "email_responsavel"
    t.integer  "telefone_responsavel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estabelecimentos", :force => true do |t|
    t.string   "tipo_estabelecimento"
    t.integer  "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fotos", :force => true do |t|
    t.string   "imagem_legenda"
    t.integer  "estabelecimento_id"
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hoteis_pousadas", :force => true do |t|
    t.integer  "estabelecimento_id"
    t.text     "apresentacao"
    t.text     "tipo_acomodacao"
    t.text     "caracteristica_acomodacao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imovel_locacoes", :force => true do |t|
    t.integer  "estabelecimento_id"
    t.string   "endereco_imovel"
    t.string   "cidade_imovel"
    t.string   "bairro_imovel"
    t.string   "entre_ruas"
    t.string   "ponto_referencia"
    t.float    "valor_aluguel"
    t.float    "valor_condominio"
    t.float    "area_total"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurantes", :force => true do |t|
    t.integer  "estabelecimento_id"
    t.text     "descricao"
    t.text     "cardapio"
    t.text     "forma_pagamento"
    t.text     "horario_atendimento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tarifarios", :force => true do |t|
    t.string   "acomodacao"
    t.float    "valor_balcao"
    t.float    "valor_internet"
    t.string   "periodo"
    t.date     "iniciar_em"
    t.date     "terminar_em"
    t.integer  "estabelecimento_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "persistence_token"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
    t.integer  "roles_mask"
  end

end
