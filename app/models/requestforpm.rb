class Requestforpm < ApplicationRecord

  belongs_to :passengerride
  belongs_to :customer, :class_name => 'User'

end
