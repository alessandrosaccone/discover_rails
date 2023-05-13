class GuideUsersController < ApplicationController
    def index
        @users = User.all
        respond_to do |format|
        format.html # render the index.html.erb view
        format.json { render json: @users } # return the user data in JSON format
        end
    end
        
    def update_location
        current_user.update(lat: params[:lat], long: params[:lng])
        render json: { success: true }
    end
        
end
        
