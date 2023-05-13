class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?




    protected
    def configure_permitted_parameters
        attributes = [:name, :email, :password]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
        devise_parameter_sanitizer.permit(:sign_up, keys: [:iva])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role_id])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:remember_me])
    end

   
end
