# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  #before_action :configure_sign_up_params, only: [:create]
  before_action :configure_permitted_parameters
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
   def new
     super
   end

  # POST /resource
  def create
      if params[:user][:role_id]=="10"
        account_link=nil;
        begin
          stripe_account = Stripe::Account.create({
            type: 'custom',
            email: params[:user][:email],
            business_type: 'individual',
            individual: {
              email: params[:user][:email],
              first_name: params[:user][:name],
              last_name: params[:cognome],
            },
            business_profile: {
              mcc: '4722',
              product_description: 'Tourism services'
            
            },
            requested_capabilities: ['card_payments', 'transfers'],
          })
          Stripe::Account.update(
            stripe_account.id,
            {tos_acceptance: {date: 1609798905, ip: '8.8.8.8'}},
          )
          stripe_account.id
          account_link = Stripe::AccountLink.create({
            account: stripe_account.id,
            refresh_url: 'http://localhost:3000',
            return_url: 'http://localhost:3000', 
          })
      
          rescue Stripe::StripeError => e
            # Handle Stripe-specific errors
            # You can log the error for debugging purposes
            Rails.logger.error("Stripe error: #{e.message}")
            #risolvere frontend
            redirect_to new_user_registration_path,notice: e.message
            return
        
          rescue => e
            # Handle other unexpected errors
            # Log the error for debugging purposes
            Rails.logger.error("Unexpected error: #{e.message}")
            #risolvere frontend per errore console
            redirect_to new_user_registration_path,notice: e.message
            return
         end
      super do |resource|
        resource.stripe_account_id = stripe_account.id
        bacheca_guida = BachecaGuida.new
        bacheca_guida.user_id = resource.id
        bacheca_guida.save
        resource.save
      end
      redirect_to account_link.url, allow_other_host: true 
    else
      super do |resource|
        bacheca_utente = BachecaUtente.new
        bacheca_utente.user_id = resource.id
        bacheca_utente.save
      end
    end

  end
  

  # GET /resource/edit
   def edit
     super
   end

  # PUT /resource
   def update
     super
   end

   def cambia_img
    current_user.avatar.attach(params[:avatar])
    if current_user.guide?
      redirect_to show_bacheca_path()
    else
      redirect_to show_bacheca_utenti_path()
    end
   end


  # DELETE /resource
   def destroy
      if current_user.tourist?
        bookings=current_user.bookings
        bookings.each do |booking|
          if booking.refunded==false && booking.expired==false
            redirect_to show_bacheca_utenti_path,notice: "Hai prenotazioni attive. Non puoi cancellare l'account."
            return
          end
        end
      else
        posts=Post.where(user_id: current_user.id)
        posts.each do |post|
          if post.status=="open"
            redirect_to show_bacheca_path,notice: "Hai post attivi. Non puoi cancellare l'account."
            return
          end
        end
      end
      super
   end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_permitted_parameters
    attributes = [:name, :email, :password,:iva,:role_id,:remember_me, :avatar, :cognome ]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
