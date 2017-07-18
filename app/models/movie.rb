class Movie < ActiveRecord::Base
  has_many :appearences
  has_many :actors, :through => :appearences
end
