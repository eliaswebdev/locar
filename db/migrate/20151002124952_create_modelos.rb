class CreateModelos < ActiveRecord::Migration
  def change
    create_table :modelos do |t|
      t.integer :marca_id

      t.timestamps null: false
    end
  end
end
