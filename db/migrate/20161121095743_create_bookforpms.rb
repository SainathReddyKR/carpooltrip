class CreateBookforpms < ActiveRecord::Migration[5.0]
  def change
    create_table :bookforpms do |t|

      t.belongs_to :passengerride
      t.belongs_to :customer, class: 'User'
      t.timestamps
    end
  end
end
