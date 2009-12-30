class Tarifario < ActiveRecord::Base
  attr_accessible :acomodacao, :valor_balcao, :valor_internet, :periodo, :iniciar_em, :terminar_em, :estabelecimento_id
end
