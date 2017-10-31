class CreateDesiredoutcomes < ActiveRecord::Migration[5.1]
  def change
    create_table :desiredoutcomes do |t|
      t.string :title, null: false
      t.boolean :private, null: false, default: false
      t.text :details
      t.boolean :completed, null: false, default: true
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :goals, :title
    add_index :goals, :user_id
  end
end
