class Requestfordm < ApplicationRecord

  belongs_to :driverride
  belongs_to :customer, :class_name => 'User'

end
