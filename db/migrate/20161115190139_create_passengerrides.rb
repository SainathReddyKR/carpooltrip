class CreatePassengerrides < ActiveRecord::Migration[5.0]
  def change
    create_table :passengerrides do |t|

      t.string :vehicle
      t.integer :seats
      t.string :model
      t.integer :rent
      t.integer :mileage
      t.boolean :ac
      t.boolean :tv
      t.boolean :music
      t.boolean :auxcable
      t.boolean :bluetooth
      t.boolean :navigation
      t.boolean :rearbackupcamera
      t.boolean :pets
      t.boolean :drinking
      t.boolean :eating
      t.boolean :smoking
      t.text :additionalinfo
      t.text :pickup
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
