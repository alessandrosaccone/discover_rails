class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]
    def home  
    end


    def dummypage
    end

<<<<<<< HEAD

    def guides
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
    def guides
        @users = User.all
    end
>>>>>>> 263c4c7 (Creata pagina Guide ma si deve inserire js)
end
