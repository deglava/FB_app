class User < ActiveRecord::Base
  # Include default facebook_app modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def self.search(query)
    where("Fname like ? or Lname like ? or email like ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end
end
