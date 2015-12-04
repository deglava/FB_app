class AddStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Status, :string
  end
end
