class CreateRequestforpms < ActiveRecord::Migration[5.0]
  def change
    create_table :requestforpms do |t|

      t.belongs_to :passengerride
      t.belongs_to :customer, class: 'User'
      t.string :status
      t.timestamps
    end
  end
end
