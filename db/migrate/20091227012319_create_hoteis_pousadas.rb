class CreateHoteisPousadas < ActiveRecord::Migration
  def self.up
    create_table :hoteis_pousadas do |t|
      t.integer :estabelecimento_id
      t.text :apresentacao
      t.integer :tipo_acomodacao
      t.text :caracteristica_acomodacao
      t.timestamps
    end
  end
  
  def self.down
    drop_table :hoteis_pousadas
  end
end
