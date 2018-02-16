class VehiclesController < ApplicationController

  def new
    @vehicle = Vehicle.new
  end

  def create
    company = Company.find(params[:company_id])
    vehicle = company.vehicles.new(vehicle_params)
    if vehicle.save
      redirect_to user_company_path(company.user, company)
    else
      render :new
    end
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    vehicle = Vehicle.find(params[:id])
    if vehicle.update(vehicle_params)
      redirect_to user_company_path(vehicle.company.user, vehicle.company)
    else
      render :edit
    end
  end

  def destroy
    vehicle = Vehicle.find(params[:id])
    vehicle.destroy
    redirect_to user_company_path(vehicle.company.user, vehicle.company)
  end

    private
      def vehicle_params
        params.require(:vehicle).permit(:category, :seats, :price)
      end

end