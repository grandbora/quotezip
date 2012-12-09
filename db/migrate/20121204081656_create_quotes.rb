class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quote do |t|
      t.text :content
      t.string :book
      t.timestamps
    end
  end
end