class CreateUser < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :email
      t.timestamps
    end
  end
end
