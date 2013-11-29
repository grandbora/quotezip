class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user, index: true
      t.references :quote, index: true

      t.timestamps
    end

    add_index :votes, [:user, :quote], :unique => true
  end
end
