class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end
  def new
    @location = Location.new(name: "Home", zip: current_user.zip)
  end

  def create
    @location = Location.new(location_params)
    @location.set_or_update_default(location_params[:default])
    @location.user = current_user

    if @location.save
      flash[:notice] = "Location added successfully"
      redirect_to locations_path
    else
      flash[:notice] = "Unable to save location"
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :address, :city, :state, :zip, :default)
  end
end
