class User < ActiveRecord::Base
  has_many :outfits
  has_secure_password

  validates_uniqueness_of :email
  validates_presence_of :name, :email, :gender, :location
  validates_presence_of :password, :on => :create
  validates :location, numericality: {only_integer: true}
  validates_confirmation_of :password
end
