class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :timeline_id
      t.integer :msg_id

      t.timestamps null: false
    end
  end
end
