class Appearence < ActiveRecord::Base
  belongs_to :movie
  belongs_to :actor
end
