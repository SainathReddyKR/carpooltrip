class AddUserToPassengerrides < ActiveRecord::Migration[5.0]
  def change
    add_reference :passengerrides, :user, foreign_key: true
  end
end
