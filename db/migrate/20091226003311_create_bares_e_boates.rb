class CreateBaresEBoates < ActiveRecord::Migration
  def self.up
    create_table :bares_e_boates do |t|
      t.integer :estabelecimento_id
      t.text :descricao
      t.text :publico_alvo
      t.text :forma_pagamento
      t.text :horario_atendimento
      t.timestamps
    end
  end

  def self.down
    drop_table :bares_e_boates
  end
end

