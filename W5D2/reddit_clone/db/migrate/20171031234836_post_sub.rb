class PostSub < ActiveRecord::Migration[5.1]
  def change
    create_table :postsubs do |t|
      t.integer :post_id, null: false
      t.integer :sub_id, null: false

      t.timestamps
    end
  end
end
