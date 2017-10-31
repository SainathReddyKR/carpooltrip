class Bookforpm < ApplicationRecord

  belongs_to :passengerride
  belongs_to :customer, :class_name => 'User'

  validates_uniqueness_of :passengerride
end
