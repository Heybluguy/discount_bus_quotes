class CompaniesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @company = @user.companies.new
  end

  def create

    @user = User.find(params[:user_id])
    @company = @user.companies.new(company_params)
    if @company.save
      redirect_to user_companies_path(@user)
    else
      render :new
    end
  end

  def index
    @user = User.find(params[:user_id])
    @companies = @user.companies
  end

    private
      def company_params
        params.require(:company).permit(:name, :phone, :email, :website, :description, :image)
      end
end