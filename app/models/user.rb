class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :name, :email
  validates_presence_of :password_digest
  validates :password, :length => {:minimum => 6}

  has_many :bids, dependent: :destroy
  has_many :listings, dependent: :destroy
end
