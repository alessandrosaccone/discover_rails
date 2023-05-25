class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def switch_language
        puts "Language selected: #{params[:language]}"
        I18n.locale = params[:language] || I18n.default_locale
        redirect_back(fallback_location: root_path)
    end

    protected
    def configure_permitted_parameters
        attributes = [:name, :email, :password, :iva, :role_id, :remember_me]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    end

end
