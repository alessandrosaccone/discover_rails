class PagesController < ApplicationController
    
    def home  
    end

    def dummypage
    end

    def guides
        @guides = User.where(role_id: 10)
        nome = params[:nome]
        citta = params[:citta]
      
        # Modifica la variabile @guides in base agli input del form (nome e citta)
        if nome.present?
          @guides = @guides.where(name: nome)
        end
        if citta.present?
          @guides = @guides.where(city: citta)
        end

    end
      
end
