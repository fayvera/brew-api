class Api::UsersController < ApplicationController
    before_action :find_user, only: [:update]
    before_action :set_user, :new_location, only: [:destroy]
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
        brewery = Brewery.find_by(obdb_id: params[:brewery][:obdb_id])
        if brewery === nil
            brewery = Brewery.create(name: params[:brewery][:name], id: params[:brewery][:id],
            phone: params[:brewery][:phone], website_url: params[:brewery][:website_url], 
            brewery_type: params[:brewery][:brewery_type], obdb_id: params[:brewery][:obdb_id], location: nil)
        end
        if @user && !@user.breweries.include?(brewery)
            if  !brewery.location
                @location = Location.new(country: params[:brewery][:country], 
                state: params[:brewery][:state], city: params[:brewery][:city], 
                address: params[:brewery][:address_2], street: params[:brewery][:street],
                postal_code: params[:brewery][:postal_code], longitude: params[:brewery][:longitude], 
                latitude: params[:brewery][:latitude])
            end
            # byebug
            if @location.save 
                brewery.update(location: @location)          
            end       
             @user.breweries << brewery     
            #  byebug
            if @user.save
                render json: {user: @user, liked: @user.breweries}
            else
                render json: @user.errors
            end
        elsif @user && @user.breweries.include?(brewery)
            @user.breweries.delete(brewery)
            render json: @user
        end
    end

    def destroy
        @user.destroy
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def find_user
        @user = User.find(params[:user_id])
    end

    def new_location
        @location = Location.new(country: params[:brewery][:country], 
        state: params[:brewery][:state], city: params[:brewery][:city], 
        address: params[:brewery][:address_2], street: params[:brewery][:street],
        postal_code: params[:brewery][:postal_code], longitude: params[:brewery][:longitude], 
        latitude: params[:brewery][:latitude])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password_digest, :id, breweries: [])
    end
end


