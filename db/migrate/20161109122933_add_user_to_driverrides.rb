class AddUserToDriverrides < ActiveRecord::Migration[5.0]
  def change
    add_reference :driverrides, :user, foreign_key: true
  end
end
