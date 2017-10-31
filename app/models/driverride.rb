class Driverride < ActiveRecord::Base


  belongs_to :user

  has_many :requestforpms

  validates :origin, presence: true
  validates :destination, presence: true
  validates :departuretime, presence: true
  validates :departuredate, presence: true
  validates :okwithgender, presence: true
  validates :okwith, presence: true
  validates :sharegasmoney, presence: true
  validates :seatsavailable, presence: true, :numericality => { :greater_than_or_equal_to => 0 }



end