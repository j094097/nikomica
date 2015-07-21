class AddHashedId < ActiveRecord::Migration
  def change
    add_column :users, :hashed_id, :string
    add_column :posts, :hashed_id, :string

    add_index :users, :hashed_id
    add_index :posts, :hashed_id
  end
end
