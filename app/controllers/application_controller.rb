class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?


    def authenticate_user!
        if user_signed_in?
            super
        else
            redirect_to root
        end
    end

    protected
    def configure_permitted_parameters
        attributes = [:name, :email, :password]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    end

    private
    def after_sign_in_path_for(resource_or_scope)
        'pages#dummypage'
    end
end
