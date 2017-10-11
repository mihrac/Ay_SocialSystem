class CreateBlockingships < ActiveRecord::Migration[5.1]
  def change
    create_table :blockingships do |t|
      t.integer :blocker_id
      t.integer :blocked_id

      t.timestamps
    end
    add_index :blockingships, :blocker_id
    add_index :blockingships, :blocked_id
    add_index :blockingships, [:blocker_id, :blocked_id], unique: true
  end
end
