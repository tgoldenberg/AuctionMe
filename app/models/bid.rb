class Bid < ActiveRecord::Base
  validates_presence_of :amount
  belongs_to :listing
  belongs_to :user
end
