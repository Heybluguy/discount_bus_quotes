class Company < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :vehicles, dependent: :destroy
  has_many :company_states, dependent: :destroy
  has_many :states, through: :company_states
  has_many :addresses

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude
  after_validation :geocode, :if => :address_changed?
  after_validation :reverse_geocode, :if => :address_changed?

  def coords_changed?
    latitude.present? &&
    longitude.present? &&
    latitude_changed? &&
    longitude_changed?
  end
end
