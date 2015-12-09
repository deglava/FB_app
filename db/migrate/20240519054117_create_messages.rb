class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recev_id
      t.boolean :new

      t.timestamps null: false
    end
  end
end
