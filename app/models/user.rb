class User < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :password, presence: true, length: {minimum: 2}
  validates :email_address, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  before_save do 
    self.first_name.capitalize!
  	self.last_name.capitalize!
  	self.email_address.downcase!  
  end

end
