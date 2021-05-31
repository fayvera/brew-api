class Api::BreweriesController < ApplicationController
    before_action :set_breweries, only: [:index, :show]

    def index
        render json: Brewery.all
    end

    def show
        render json: @brewery
    end

    private

    def set_breweries
        @brewery = Brewery.find(params[:id])
    end

    def brewery_params
        params.require(:brewery).permit(:name, :phone, :website_url, :brewery_type, :location_id)
    end 
end
