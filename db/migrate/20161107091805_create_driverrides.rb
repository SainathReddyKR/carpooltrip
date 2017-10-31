class CreateDriverrides < ActiveRecord::Migration[5.0]
  def change
    create_table :driverrides do |t|
      t.string :origin
      t.string :destination
      t.time :departuretime
      t.string :departuredate
      t.string :okwithgender
      t.string :okwith
      t.string :sharegasmoney
      t.integer :seatsavailable
      t.text :description
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
