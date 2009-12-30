class BaresEBoate < ActiveRecord::Base
  attr_accessible :nome_estabelecimento, :descricao, :publico_alvo, :forma_pagamento, :horario_atendimento
  belongs_to :estabelecimento
end

