class Company < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :company_states
  has_many :states, through: :company_states
end