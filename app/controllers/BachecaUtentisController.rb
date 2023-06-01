class BachecaUtentisController < ApplicationController
    def show
        @bacheca_utenti = BachecaUtente.find_or_initialize_by(user_id: current_user.id)
        
        if @bacheca_utenti.new_record?
          @bacheca_utenti.save
        end

        @name = User.where(id: current_user.id).first.name
    end
        
    def edit
        @bacheca_utenti = Bacheca.find(params[:id])
    end   
end

