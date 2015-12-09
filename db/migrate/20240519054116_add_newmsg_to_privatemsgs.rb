class AddNewmsgToPrivatemsgs < ActiveRecord::Migration
  def change
    add_column :privatemsgs, :newmsg, :boolean
  end
end
