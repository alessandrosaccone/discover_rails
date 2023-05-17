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
      
      flash.delete(:notice)
      super
   end

  # DELETE /resource/sign_out
    def destroy
      flash.delete(:notice)
      super
    end
    

  protected
  def set_user_online
    current_user.update(online: true)
  end

  def set_user_offline
    current_user.update(online: false)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
