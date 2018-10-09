class State < ApplicationRecord
  has_many :company_states
  has_many :companies, through: :company_states

  def self.add_states(state_ids, company)
    unique_ids = state_ids.uniq
    unique_ids.delete("")
    unique_ids.each do |id|
      company.company_states.find_or_create_by(state_id: id)
    end
  end

end