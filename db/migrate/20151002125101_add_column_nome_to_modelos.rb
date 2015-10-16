class AddColumnNomeToModelos < ActiveRecord::Migration
  def change
    add_column :modelos, :nome, :string
  end
end
