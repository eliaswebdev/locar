class AddColumnFotoToVeiculos < ActiveRecord::Migration
  def change
    add_column :veiculos, :foto, :string
  end
end
