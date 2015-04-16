class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, uniqueness: true

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
