class CreateImovelLocacoes < ActiveRecord::Migration
  def self.up
    create_table :imovel_locacoes do |t|
      t.integer :estabelecimento_id
      t.string :endereco_imovel
      t.string :cidade_imovel
      t.string :bairro_imovel
      t.string :entre_ruas
      t.string :ponto_referencia
      t.float :valor_aluguel
      t.float :valor_condominio
      t.float :area_total
      t.text :descricao
      t.timestamps
    end
  end

  def self.down
    drop_table :imovel_locacoes
  end
end

