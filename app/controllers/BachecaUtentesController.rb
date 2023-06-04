class BachecaUtentesController < ApplicationController
    def show
        session[:index] = 0
        @bacheca_utenti = BachecaUtente.find_or_initialize_by(user_id: current_user.id)
        
        if @bacheca_utenti.new_record?
          @bacheca_utenti.save
        end

        @name = User.where(id: current_user.id).first.name
    end
        
    def edit
        @bacheca_utenti = BachecaUtente.find(params[:id])
    end
    
    def update
        @bacheca_utenti = BachecaUtente.find(params[:id])
        if @bacheca_utenti.update(bacheca_params)
          redirect_to show_bacheca_utenti_path, notice: "Board updated successfully"
        end
    end

    def index_for_post
        @index = session[:index]
    
        bookings = Booking.where(user_id: current_user.id).order(created_at: :desc).limit(10).offset(@index)
    
        render json: bookings
    
        session[:index] += 1
    end

    private

    def bacheca_params
        params.require(:bacheca_utente).permit(:descrizione)
    end
end

