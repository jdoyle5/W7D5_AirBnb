class CreatePostsubs < ActiveRecord::Migration[5.1]
  def change
    drop_table :postsubs
    create_table :postsubs do |t|
      t.integer :post_id, null: false
      t.integer :sub_id, null: false
      
      t.timestamps
    end
  end
end
