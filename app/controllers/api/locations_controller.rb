class Api::LocationsController < ApplicationController

    def index
        render json: 
    end

    def show

    end

    private

    def set_location
        @location = Location.find(params[:id])
    end

    def location_params
        params.require(:location).permit(:country, :state, :city, :address, :street, :longitude, ;latitude)
    end
end
