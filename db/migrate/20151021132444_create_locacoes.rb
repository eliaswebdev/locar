class CreateLocacoes < ActiveRecord::Migration
  def change
    create_table :locacoes do |t|
      t.references :cliente, index: true, foreign_key: true
      t.belongs_to :veiculo, index: true, foreign_key: true
      t.float :valor_diaria
      t.float :valor_desconto
      t.integer :quilometragem_inicial
      t.integer :quilometragem_final
      t.date :data_locacao
      t.date :data_devolucao

      t.timestamps null: false
    end
  end
end
