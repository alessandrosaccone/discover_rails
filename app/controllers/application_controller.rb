class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_locale

    def switch_language
        chosen_language = params[:language] || I18n.default_locale
    
        puts "Language selected: #{chosen_language}"
        
        # Store the chosen language in the session
        session[:language] = chosen_language
    
        I18n.locale = chosen_language
        redirect_back(fallback_location: root_path)
    end
=begin    
    def switch_language
        puts "Language selected: #{params[:language]}"
        I18n.locale = params[:language] || I18n.default_locale
        redirect_back(fallback_location: root_path)
    end
=end
    private

    def set_locale
        I18n.locale = session[:language] || I18n.default_locale
    end

    protected
    def configure_permitted_parameters
        attributes = [:name, :email, :password, :iva, :role_id, :remember_me]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    end

end
