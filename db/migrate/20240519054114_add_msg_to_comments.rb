class AddMsgToComments < ActiveRecord::Migration
  def change
    add_column :comments, :msg, :string
  end
end
