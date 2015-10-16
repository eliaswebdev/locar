class AddColumnAdicionalsToClientes < ActiveRecord::Migration
  def change
    add_column :clientes, :email, :string
    add_column :clientes, :genero, :string
  end
end
