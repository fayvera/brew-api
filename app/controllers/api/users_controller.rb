class Api::UsersController < ApplicationController
    before_action :set_user, :new_location only: [:update, :destroy]
    before_action :current_user, only: [:show, :update]
    skip_before_action :authorized, only: [:create, :update]

    def create
        @user = User.create(user_params)
        if @user.valid? 
            @token = encode_token(user_id: @user.id)
            render json: { user: @user, jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end 
    end

    def show
        render json: @user
    end

    def update
        brewery = Brewery.find_by(params[:brewery][:id])
        if @user && !@user.breweries.include?(brewery)
            byebug

            # @location.find_by(params[:brewery][:street])
            # if  !@location.id   
                @location.save

                @brewery = Brewery.new(name: params[:brewery][:name], id: params[:brewery][:id],
                phone: params[:brewery][:phone], website_url: params[:brewery][:website_url], 
                brewery_type: params[:brewery][:brewery_type], location_id: @location.id)
            if @user.update(breweries << @brewery)

                render json: @user
            elsif @user && @user.breweries.include?(params[:brewery])
                byebug
                # unlike
            else
                render json: @user.errors
            end
        end
    end

    def destroy
        @user.destroy
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def new_location
        @location = Location.new(country: params[:brewery][:country], 
        state: params[:brewery][:state], city: params[:brewery][:city], 
        address: params[:brewery][:address_2], street: params[:brewery][:street],
        longitude: params[:brewery][:longitude], latitude: params[:brewery][:latitude])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password_digest, :id, breweries: [])
    end
end


