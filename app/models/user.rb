class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :timelines
  #has_many :posts, :through => :timelines

  # Include default facebook_app modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :image, styles: {
                               small: '100x100>',
                               medium: '200x200#',
                               large: '300x300>'
                           }, :default_url => "/images/:style/missing.png"

  validates :image,
            attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
            attachment_size: { less_than: 5.megabytes }


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def self.search(query)
    where("Fname like ? or Lname like ? or email like ?", "%#{query}%", "%#{query}%", "%#{query}%")
  end

end