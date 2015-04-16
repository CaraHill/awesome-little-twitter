class User < ActiveRecord::Base
  # Remember to create a migration!

  validates :email, uniqueness: true


  has_many :tweets
end
