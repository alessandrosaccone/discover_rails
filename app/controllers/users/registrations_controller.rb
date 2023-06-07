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
    #serve per i test, nella realtà la guida deve darci tramite form il suo stripe_account_id. più semplice crearli così che a mano
    super do |resource|
      if resource.guide?
      stripe_account = Stripe::Account.create({
        type: 'custom',
        country: 'IT',
        email: resource.email,
        business_type: 'individual',
        individual: {
          email: resource.email,
          first_name: resource.name,
          last_name: resource.name,
          address: {
            line1: "Via dei Campi Flegrei",
            city: "Roma",
            state: "Lazio",
            postal_code: "00141",
            country: "IT"
          },
          phone: '3388188350', # Numero di telefono
          dob: {
            day: 1, # Giorno di nascita
            month: 1, # Mese di nascita
            year: 1990 # Anno di nascita
          },
          id_number: 'ABCD1234EFGH5678' # Codice fiscale
        },
        business_profile: {
          mcc: '4722',
          url: 'https://www.finto.it' #è necessario
           
        },
        requested_capabilities: ['card_payments', 'transfers'],
        external_account: {
          object: 'bank_account',
          country: 'IT',
          currency: 'eur',
          account_holder_name: resource.name,
          account_holder_type: 'individual',
          account_number: 'IT60X0542811101000000123456'
        }
      })
      Stripe::Account.update(
        stripe_account.id,
        {tos_acceptance: {date: 1609798905, ip: '8.8.8.8'}},
      )
    stripe_account.id
      resource.stripe_account_id = stripe_account.id
      resource.save
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
  # def destroy
  #   super
  # end

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
    attributes = [:name, :email, :password,:iva,:role_id,:remember_me, :avatar]
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
