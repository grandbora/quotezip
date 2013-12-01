class CreateReadMillImports < ActiveRecord::Migration
  def change
    create_table :read_mill_imports do |t|
      t.string :last_import

      t.timestamps
    end
  end
end
