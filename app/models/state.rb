class State < ApplicationRecord
  has_many :company_states
  has_many :companies, through: :company_states
end