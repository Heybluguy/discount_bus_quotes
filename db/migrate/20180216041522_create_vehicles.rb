class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :category
      t.integer :seats
      t.integer :price
      t.references :company, foreign_key: true
    end
  end
end
