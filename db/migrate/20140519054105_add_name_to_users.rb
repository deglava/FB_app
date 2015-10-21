
class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Fname, :string
    add_column :users, :Lname, :string
    add_column :users, :DOB, :date
    add_column :users, :gender, :string
  end
end

