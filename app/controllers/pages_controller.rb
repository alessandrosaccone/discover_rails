class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]
    def home  
    end





    def guides
        @guides = User.where(role_id: 10)
        nome = params[:nome]
        citta = params[:citta]
        linguaggio=params[:linguaggio]
        nazione=params[:nazione]
        # Modifica la variabile @guides in base agli input del form (nome e citta)
        if nome.present?
          #SANITIZED
          condition_sanitized = ActiveRecord::Base.sanitize_sql_for_conditions(["LOWER(users.name) LIKE ?", "%#{nome.downcase}%"])
          @guides = @guides.where(condition_sanitized)
          #@guides = @guides.where("LOWER(users.name) LIKE ?", "%#{nome.downcase}%")
        end
        if citta.present?
          #SANITIZED
          condition_sanitized = ActiveRecord::Base.sanitize_sql_for_conditions(["LOWER(cities.name) LIKE ?", "%#{citta.downcase}%"])
          @guides = @guides.joins(:city).where(condition_sanitized)
          #@guides = @guides.joins(:city).where("LOWER(cities.name) LIKE ?", "%#{citta.downcase}%")
        end
        if linguaggio.present?
          #SANITIZED
          condition_sanitized = ActiveRecord::Base.sanitize_sql_for_conditions(["languages.name LIKE ?", "%#{linguaggio}%"])
          @guides = @guides.joins(:languages).where(condition_sanitized)
          #@guides = @guides.joins(:languages).where("languages.name LIKE ?", "%#{linguaggio}%")
        end
        if nazione.present?
          #SANITIZED
          condition_sanitized = ActiveRecord::Base.sanitize_sql_for_conditions(["LOWER(countries.name) LIKE ?", "%#{nazione.downcase}%"])
          @guides = @guides.joins(city: :country).where(condition_sanitized)
          #@guides = @guides.joins(city: :country).where("LOWER(countries.name) LIKE ?", "%#{nazione.downcase}%")
        end
        if request.xhr?
          render partial: 'guides_results', locals: { guides: @guides }
        else
          respond_to do |format|
            format.html { render 'guides' }
          end
        end
    end
      
end
