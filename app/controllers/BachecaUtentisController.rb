class BachecaUtentisController < ApplicationController
    def show
        session[:index] = 0
        @bacheca_utenti = BachecaUtente.find_or_initialize_by(user_id: current_user.id)
        
        if @bacheca_utenti.new_record?
          @bacheca_utenti.save
        end

        @name = User.where(id: current_user.id).first.name
    end
        
    def edit
        @bacheca_utenti = Bacheca.find(params[:id])
    end   

    def index_for_post
        @index = session[:index]
    
        bookings = Booking.where(user_id: current_user.id).order(created_at: :desc).limit(10).offset(@index)
    
        render json: bookings
    
        session[:index] += 1
    end
end

