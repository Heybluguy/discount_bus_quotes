class Admin::StatesController < Admin::BaseController

  def index
    @states = State.all
  end

  def new
    @admin = current_user
    @state = State.new
  end

  def create
    @admin = current_user
    @state = State.new(state_params)
    if @state.save
      redirect_to admin_states_path(@admin)
    else
      render :new
    end
  end

  def destroy
    require 'pry'; binding.pry
    @admin = current_user
    state = State.find(params[:id])
    state.destroy
    redirect_to admin_states_path(@admin)
  end

  private
    def state_params
      params.require(:state).permit(:name)
    end
end