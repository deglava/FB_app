class Timeline < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :msgs,  :through => :comments
end
