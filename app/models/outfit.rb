class Outfit < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :temp, :rain, :name
end
