class CreateClientes < ActiveRecord::Migration
  def self.up
    create_table :clientes do |t|
      t.string :nome_fantasia
      t.string :razao_social
      t.string :cnpj_estabelecimento
      t.string :ramo_atuacao
      t.string :endereco_estabelecimento
      t.string :numero_estabelecimento
      t.string :complemento_estabelecimento
      t.string :cep_estabelecimento
      t.string :bairro_estabelecimento
      t.string :cidade_estabelecimento
      t.string :estado_estabelecimento
      t.string :telefone_comercial
      t.string :telefone_celular
      t.string :telefone_fax
      t.string :email_estabelecimento
      t.string :nome_responsavel
      t.string :email_responsavel
      t.integer :telefone_responsavel
      t.timestamps
    end
  end

  def self.down
    drop_table :clientes
  end
end

