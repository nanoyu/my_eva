class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :title
      t.string :product_name
      t.text :product_image_id
      t.integer :price
      t.text :body
      t.integer :category_id
      t.datetime :delete_at
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
