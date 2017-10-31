class CreateRequestfordms < ActiveRecord::Migration[5.0]
  def change
    create_table :requestfordms do |t|

      t.belongs_to :driverride
      t.belongs_to :customer, class: 'User'
      t.string :status
      t.timestamps
    end
  end
end
