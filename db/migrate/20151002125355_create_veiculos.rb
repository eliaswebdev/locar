class CreateVeiculos < ActiveRecord::Migration
  def change
    create_table :veiculos do |t|
      t.references :modelo, index: true, foreign_key: true
      t.string :placa
      t.integer :quilometragem
      t.string :cor
      t.integer :ano_fabricacao
      t.integer :ano_modelo
      t.integer :portas

      t.timestamps null: false
    end
  end
end
