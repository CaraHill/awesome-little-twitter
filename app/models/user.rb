class User < ActiveRecord::Base
  # Remember to create a migration!
  # validates :email

  has_many :tweets
end
