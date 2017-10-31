class Passengerride < ApplicationRecord


  belongs_to :user

  has_one :bookforpm

  has_many :requestforpms

  validates :vehilce, presence: true
  validates :seats, presence: true
  validates :departuretime, presence: true
  validates :departuredate, presence: true
  validates :okwithgender, presence: true
  validates :okwith, presence: true
  validates :sharegasmoney, presence: true

end
