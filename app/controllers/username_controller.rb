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

    def update_lang
        @user = current_user
        lingua = params[:user][:languages]
        
        @new_lang = Language.find_or_create_by(name: lingua)
        
        unless @user.languages.include?(@new_lang)
          @user.languages << @new_lang
        end
        
        if @user.save
          redirect_to show_bacheca_path, notice: 'Languages updated successfully.' # Reindirizza a una pagina di conferma o alla pagina desiderata
        else
          # Gli errori di validazione possono essere gestiti qui
          render :edit # Reindirizza nuovamente alla pagina di modifica, se necessario
        end
      end
    
    def update_city
      @user = current_user
      city = params[:user][:city]
      country=params[:user][:country]
      @new_city = City.find_or_create_by(name: city)
      @new_country = Country.find_or_create_by(name: country)
      @new_city.country=@new_country
      @new_city.save
      @user.city=@new_city
      if @user.save
        redirect_to show_bacheca_path, notice: 'Languages updated successfully.' # Reindirizza a una pagina di conferma o alla pagina desiderata
      else
        # Gli errori di validazione possono essere gestiti qui
        render :edit # Reindirizza nuovamente alla pagina di modifica, se necessario
      end


    end
      

    private
    def username_params
        params.require(:user).permit(:username)
    end
end
