class RemoveColumnGeneroToClientes < ActiveRecord::Migration
  def change
    remove_column :clientes, :genero, :string
  end
end
