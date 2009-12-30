class Estabelecimento < ActiveRecord::Base

  has_many :bares_e_boate, :dependent => :destroy
  has_many :restaurante, :dependent => :destroy
  has_many :imovel_locacao, :dependent => :destroy
  has_many :hoteis_pousada, :dependent => :destroy
  has_many :foto, :dependent => :destroy
  has_many :tarifario, :dependent => :destroy
  belongs_to :cliente

  validates_uniqueness_of :cliente_id
  validates_presence_of :cliente_id, :tipo_estabelecimento

end

