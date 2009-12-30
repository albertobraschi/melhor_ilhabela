class CreateEstabelecimentos < ActiveRecord::Migration
  def self.up
    create_table :estabelecimentos do |t|
      t.string :tipo_estabelecimento
      t.integer :cliente_id

      t.timestamps
    end
  end

  def self.down
    drop_table :estabelecimentos
  end
end

