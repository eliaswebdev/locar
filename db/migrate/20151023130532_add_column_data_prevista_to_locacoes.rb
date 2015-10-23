class AddColumnDataPrevistaToLocacoes < ActiveRecord::Migration
  def change
    add_column :locacoes, :data_prevista, :date
  end
end
