class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :published, default: 0, null: false

      t.datetime :post_date
      t.text :content

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :published
  end
end
