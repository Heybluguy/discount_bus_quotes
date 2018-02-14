class RemovePaperclipFieldsFromCompany < ActiveRecord::Migration[5.1]
  def change
    remove_column :companies, :image_file_name,    :string
    remove_column :companies, :image_content_type, :string
    remove_column :companies, :image_file_size,    :integer
    remove_column :companies, :image_updated_at,   :datetime
  end
end
