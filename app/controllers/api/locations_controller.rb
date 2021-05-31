class Api::LocationsController < ApplicationController
    before_action :set_location, only: [:index, :show]

    def index
        render json: Location.all
    end

    def show
        render json: @location
    end

    private

    def set_location
        @location = Location.find(params[:id])
    end

    def location_params
        params.require(:location).permit(:country, :state, :city, :address, :street, :longitude, :latitude)
    end
end
