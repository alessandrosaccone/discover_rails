class BookingsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    authorize! :create, Booking
    @post = Post.find(params[:post_id])
    @booking = Booking.new(post: @post)
    @num_pers=params[:persone].to_i
  end
  
  def create
    @booking = current_user.bookings.build(booking_params)
    num_pers=params[:booking][:num_pers].to_i
    post = Post.find(@booking.post_id)
    if post.persone_rimanenti >0
      if @booking.save_with_payment
        post.update(persone_rimanenti: post.persone_rimanenti - num_pers)
        redirect_to @booking.post, notice: 'Prenotazione effettuata con successo.'
      else
        render 'posts/show'
      end
    else
      render 'posts/show', alert: 'Posti esauriti per questa prenotazione.'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:amount, :card_number, :exp_month, :exp_year, :cvc, :post_id)
  end
end
  