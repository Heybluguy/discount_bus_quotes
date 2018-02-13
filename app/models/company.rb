class Company < ApplicationRecord
  belongs_to :user
  has_many :company_states
  has_many :states, through: :company_states

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

end