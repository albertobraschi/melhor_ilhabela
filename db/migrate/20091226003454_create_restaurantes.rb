class CreateRestaurantes < ActiveRecord::Migration
  def self.up
    create_table :restaurantes do |t|
      t.integer :estabelecimento_id
      t.text :descricao
      t.text :cardapio
      t.text :forma_pagamento
      t.text :horario_atendimento
      t.timestamps
    end
  end

  def self.down
    drop_table :restaurantes
  end
end

