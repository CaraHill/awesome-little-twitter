class Tweet < ActiveRecord::Base

  validates_length_of :tweet, :in => 1..140

  belongs_to :user

end
