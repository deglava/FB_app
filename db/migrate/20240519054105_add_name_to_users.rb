
class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Fname, :string
    add_column :users, :Lname, :string
    add_column :users, :DOB, :date
    add_column :users, :gender, :string
    add_column :users, :About, :string
    add_column :users, :Address, :string
    add_column :users, :Fav_quotes, :string
  end
end

