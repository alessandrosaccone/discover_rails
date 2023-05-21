class PagesController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user!, except: [:home]
    def home 
      if user_signed_in?
        @bacheca_guida = BachecaGuida.where(guida_id: current_user).first.id
      else
        # L'utente non è loggato
        # Puoi gestire questa situazione come preferisci
      end
    end


    def dummypage
    end


    def guides
        if user_signed_in?
          @bacheca_guida = BachecaGuida.where(guida_id: current_user).first.id
        else
          # L'utente non è loggato
          # Puoi gestire questa situazione come preferisci
        end
        @guides = User.where(role_id: 10)
        nome = params[:nome]
        citta = params[:citta]
        linguaggio=params[:linguaggio]
        nazione=params[:nazione]
        # Modifica la variabile @guides in base agli input del form (nome e citta)
        if nome.present?
          @guides = @guides.where("LOWER(users.name) LIKE ?", "%#{nome.downcase}%")
        end
        if citta.present?
          @guides = @guides.joins(:city).where("LOWER(cities.name) LIKE ?", "%#{citta.downcase}%")
        end
        if linguaggio.present?
          @guides = @guides.joins(:languages).where("languages.name LIKE ?", "%#{linguaggio}%")
        end
        if nazione.present?
          @guides = @guides.joins(city: :country).where("LOWER(countries.name) LIKE ?", "%#{nazione.downcase}%")
        end
        if request.xhr?
          render partial: 'guides_results', locals: { guides: @guides }
        else
          respond_to do |format|
            format.html { render 'guides' }
          end
        end
    end
      
=======
    
    def home  
    end

    def dummypage
    end

    def guides
        @users = User.all
    end
>>>>>>> a4a836a613c8db8474711cd329815abab556f9ba
end
