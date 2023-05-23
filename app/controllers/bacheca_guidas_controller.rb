class BachecaGuidasController < ApplicationController
    def show
      @bacheca_guida = BachecaGuida.where(user_id: current_user.id).first
      if !@bacheca_guida
        @bacheca_guida = BachecaGuida.create()
      end 
    end

    def create
      @bacheca_guida = BachecaGuida.new()
      @bacheca_guida.guida_id = current_user.id
      @bacheca_guida.save()
    end

    def edit
      @bacheca_guida = BachecaGuida.find(params[:id])
    end

    def update
      @description = params[:description]
      @bacheca_guida = BachecaGuida.where(user_id: current_user.id).first
      @bacheca_guida.update(descrizione: @description)
      redirect_to bacheca_guida_path(@bacheca_guida)
    end
  end
  