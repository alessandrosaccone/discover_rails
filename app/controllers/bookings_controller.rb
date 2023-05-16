class BookingsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    authorize! :create, Booking
    @post = Post.find(params[:post_id])
    @booking = Booking.new(post: @post)
    @num_pers = params[:persone].to_i
    @price = ((@post.prezzo * @post.numero_ore) / @post.persone).to_i * params[:persone].to_i
  end

  #da finire-aspetto Mario Reda
  def refund
    @booking = Booking.find(params[:id])
    if @booking.refund_payment
      post = Post.find(@booking.post_id)
      num_pers = @booking.num_pers
      redirect_to @booking.post, notice: 'Prenotazione cancellata con successo e rimborso effettuato.'
    else
      redirect_to @booking.post, notice: 'Impossibile elaborare il rimborso.'
    end
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    num_pers = params[:booking][:num_pers].to_i
    @booking.num_pers=num_pers
    post = Post.find(@booking.post_id)
    
    #redirect_to url_for(controller: 'email', action: 'send_email'), notice: 'Prenotazione effettuata con successo'
    
    if post.persone_rimanenti > 0
      if @booking.save_with_payment
        post.update(persone_rimanenti: post.persone_rimanenti - num_pers)
        redirect_to url_for(controller: 'email', action: 'send_email'), notice: 'Prenotazione effettuata con successo'
        #redirect_to @booking.post, notice: 'Prenotazione effettuata con successo.' 
      else
        redirect_to @booking.post,notice: @booking.errors.full_messages.join('. ')
      end
    else
      redirect_to @booking.post, notice: 'Posti Esauriti.'
    end
  end 

  private

  def booking_params
    params.require(:booking).permit(:amount, :card_number, :exp_month, :exp_year, :cvc, :post_id)
  end
end
  