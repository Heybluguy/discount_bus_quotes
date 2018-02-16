class CompaniesController < ApplicationController
  before_action :check_user, only: [:new, :edit, :index]
  def new
    @company = Company.new
  end

  def create
    @user = current_user
    @company = @user.companies.new(company_params)
    if @company.save
      State.add_states(params[:company][:state_ids], @company)
      if params[:company][:images]
        Image.upload_image(@company, params[:company][:images])
      end
      redirect_to user_companies_path(@user)
    else
      render :new
    end
  end

  def index
    @user = current_user
    @companies = current_user.companies
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    company = Company.find(params[:id])
    if company.update(company_params)
      State.add_states(params[:company][:state_ids], company)
      if params[:company][:images]
        Image.upload_image(company, params[:company][:images])
      end
      redirect_to user_company_path(company.user, company)
    else
      render :edit
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def destroy
    user = current_user
    company = Company.find(params[:id])
    company.destroy
    redirect_to user_companies_path(user)
  end

    private
      def company_params
        params.require(:company).permit(:name, :phone, :email, :website, :description)
      end
end

