class Image < ApplicationRecord
  belongs_to :company
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  def self.upload_image(company, file_path)
    Image.create(image: File.new(file_path.tempfile.path, "r"), company: company)
  end
end