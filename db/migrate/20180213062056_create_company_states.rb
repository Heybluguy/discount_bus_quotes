class CreateCompanyStates < ActiveRecord::Migration[5.1]
  def change
    create_table :company_states do |t|
      t.references :company, foreign_key: true
      t.references :state, foreign_key: true
    end
  end
end
