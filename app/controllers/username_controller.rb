class UsernameController < ApplicationController
    def edit
        @user = current_user
    end

    #cambia username
    def update_username
        @user = current_user
        @user.username = params[:username]
        
        if @user.update(username_params)
            if current_user.guide?
                redirect_to show_bacheca_path, notice: "Username updated successfully"
            else
                redirect_to show_bacheca_utenti_path, notice: "Username updated successfully"
            end
       # else
            # Gestione dell'errore se il salvataggio fallisce
            #redirect_to show_bacheca_path, notice: "Failed to update username"
        end
    end

    private
    def username_params
        params.require(:user).permit(:username)
    end
end