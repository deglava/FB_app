class CreatePrivatemsgs < ActiveRecord::Migration
  def change
    create_table :privatemsgs do |t|
      t.integer :user_id
      t.string :rec_id
      t.string :msg

      t.timestamps null: false
    end
  end
end
