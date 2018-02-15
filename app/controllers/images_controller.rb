class ImagesController < ApplicationController

  def destroy
    image = Image.find(params[:id])
    image.destroy
    redirect_to edit_user_company_path(image.company.user, image.company)
  end
end