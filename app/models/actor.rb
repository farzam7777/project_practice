class Actor < ActiveRecord::Base
  has_many :appearences
  has_many :movies, :through => :appearences
end
