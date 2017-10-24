class CreateSharedWorks < ActiveRecord::Migration[5.1]
  def change
    create_table :shared_works do |t|
      t.integer :artwork_id, null: false
      t.integer :viewer_id, null: false

      t.timestamps
    end
    add_index('shared_works', 'artwork_id')
    add_index('shared_works', 'viewer_id')
  end
end
