class User < ActiveRecord::Base
  # Include default facebook_app modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  def self.search(query)
    where("Fname like ? or Lname like ? or email like ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end

  # Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
  # Socify is an Open source Social network written in Ruby on Rails This file is licensed
  # under GNU GPL v2 or later. See the LICENSE.


end
