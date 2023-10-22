# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  after_action :set_user_online, only: [:create]
  before_action :set_user_offline, only: [:destroy]

  # GET /resource/sign_in
    def new
      super
    end

  # POST /resource/sign_in
  #
  def create
    self.resource = User.find_by(email: params[:user][:email])
  
    if resource && !resource.confirmed?
      flash.now[:error] = 'You have to confirm your email address before continuing.'
      self.resource = resource_class.new(sign_in_params) # Initialize with submitted params for the form
      clean_up_passwords(resource)
      render template: 'devise/sessions/new'
    else
      flash.delete(:notice)
      super
    end
  end
  

  # DELETE /resource/sign_out
    def destroy
      flash.delete(:notice)
      super
    end
    

  protected
  def set_user_online
    if current_user
      current_user.update(online: true)
    end
  end

  def set_user_offline
    if current_user
      current_user.update(online: false)
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
