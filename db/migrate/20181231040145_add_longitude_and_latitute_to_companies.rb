class AddLongitudeAndLatituteToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :latitude, :decimal
    add_column :companies, :longitude, :decimal
  end
end
