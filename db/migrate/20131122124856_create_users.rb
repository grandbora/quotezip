class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :uid, :null => false
      t.string :user_name, :null => false
      t.string :name, :null => false
      t.text :avatar, :null => false
      t.text :url, :null => false
      t.datetime :remember_created_at

      t.timestamps
    end
    add_index :users, :uid, unique: true
  end
end
