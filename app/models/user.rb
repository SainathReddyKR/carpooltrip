class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :username
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates_presence_of :username
  validates_uniqueness_of :email
  validates_presence_of :password

  belongs_to :role
  has_many :driverrides
  has_many :passengerrides

  has_many :customers, through: :bookforpms

  has_many :customers, through: :requestforpms

  has_many :customers, through: :requestfordms


  acts_as_messageable

  before_validation :assign_role

  def assign_role
    self.role = Role.find_by_name("Member") if self.role.nil?
  end

  def admin?
    self.role.name == "Admin" if !self.role.blank?
  end
  def member?
    self.role.name == "Member" if !self.role.blank?
  end

  def name
    "#{email}"
  end

  def mailboxer_email(object)
    nil
  end

end
