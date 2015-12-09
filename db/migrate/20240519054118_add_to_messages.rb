class AddToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :msg, :string
  end
end
