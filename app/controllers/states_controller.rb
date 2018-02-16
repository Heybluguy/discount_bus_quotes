class StatesController < ApplicationController

  def show
    @state = State.find(params[:id])
  end

  def destroy
    company = Company.find(params[:company_id])
    state = State.find(params[:id])
    company_state = company.company_states.find_by(state_id: state.id)
    company_state.destroy
    redirect_to edit_user_company_path(company.user, company)
  end

end