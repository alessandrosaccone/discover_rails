class UsernameController < ApplicationController
    def edit
        @user = current_user
    end

    #cambia username
    def update_username
        @user = current_user
        @user.username = params[:username]
        
        if @user.update(username_params)
        redirect_to show_bacheca_path, notice: "Username updated successfully"
        else
        # Gestione dell'errore se il salvataggio fallisce
        redirect_to show_bacheca_path, notice: "Failed to update username"
        end
    end

    private
    def username_params
        params.require(:user).permit(:username)
    end
end
