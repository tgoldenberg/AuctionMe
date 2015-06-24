class Listing < ActiveRecord::Base
  validates_presence_of :title, :description, :condition, :start_time, :end_time
  belongs_to :user
  has_many :bids, dependent: :destroy


end
