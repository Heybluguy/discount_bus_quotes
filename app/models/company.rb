class Company < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :company_states, dependent: :destroy
  has_many :states, through: :company_states
end