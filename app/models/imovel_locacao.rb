class ImovelLocacao < ActiveRecord::Base
  attr_accessible :cliente_id, :endereco_imovel, :cidade_imovel, :bairro_imovel, :entre_ruas, :ponto_referencia, :valor_aluguel, :valor_condominio, :area_total, :descricao
  belongs_to :estabelecimento
end

