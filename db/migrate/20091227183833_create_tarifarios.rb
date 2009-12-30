class CreateTarifarios < ActiveRecord::Migration
  def self.up
    create_table :tarifarios do |t|
      t.string :acomodacao
      t.float :valor_balcao
      t.float :valor_internet
      t.string :periodo
      t.date :iniciar_em
      t.date :terminar_em
      t.integer :estabelecimento_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :tarifarios
  end
end
