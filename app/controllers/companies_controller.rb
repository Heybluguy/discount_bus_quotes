class CompaniesController < ApplicationController

  def new
    @company = Company.new
  end

  def create
    @user = User.find(params[:user_id])
    @company = @user.companies.new(company_params)
    if @company.save
      if params[:company][:images]
        Image.upload_image(@company, params[:company][:images].first)
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
      redirect_to user_company_path(company.user, company)
    else
      render :edit
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def destroy
    @user = current_user
    company = Company.find(params[:id])
    company.destroy
    redirect_to user_companies_path(@user)
  end

    private
      def company_params
        params.require(:company).permit(:name, :phone, :email, :website, :description)
      end
end

# Image.new(:image => File.new(path_to_your_file, "r"))