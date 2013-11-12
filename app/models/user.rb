class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  validates :name, presence: true
  validates :password, length: {within: 6..12 }
  emailFormatValidation = /[a-z.-]+@[a-z \d -.]+[.][a-z]+/i
  validates :email, format: {with: emailFormatValidation}
  validates :password, confirmation: true
  scope :sortname, -> {order(:name)}
  scope :sortemail, -> {order(:email)}

  def self.create_with_omniauth(auth)
  	create! do |user|
  		user.provider = auth["provider"]
  		user.uid = auth["uid"]
  		user.name = auth["info"]["name"]
  		user.email = "#{auth["info"]["nickname"]}@twitter.com"
  		user.password = "noPassReq'd"

  	end
  end
end
