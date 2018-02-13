class CompaniesController < ApplicationController

  def new
    @company = Company.new
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

  def edit
    @company = Company.find(params[:id])
  end

  def update
    company = Company.find(params[:id])
    if company.update(company_params)
      redirect_to user_company_path(company.user, company)
    else
      render :edit
    end
  end

  def show
    @company = Company.find(params[:id])
  end



    private
      def company_params
        params.require(:company).permit(:name, :phone, :email, :website, :description, :image)
      end
end