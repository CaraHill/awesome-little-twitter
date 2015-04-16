require 'SCrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!


  has_many :followers
  has_many :my_followers, through: :followers, source: :user

  validates :email, uniqueness: true

  has_many :people_i_follow, foreign_key: "follow_id", class_name: "Follower"
  has_many :users_i_follow, through: :people_i_follow, source: :follow


  has_many :tweets

  before_save do
    encrypt_password
  end

  def encrypt_password
    self.password = SCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    if user = User.find_by(email: email)
      return user if SCrypt::Password.new(user.password) == password
    else raise "Incorrect email or password or password and email or something"
    end
  end

end
