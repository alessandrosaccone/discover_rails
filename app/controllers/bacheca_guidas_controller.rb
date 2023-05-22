class BachecaGuidasController < ApplicationController
    def show
      @bacheca_guida = BachecaGuida.where(guida_id: current_user.id)
      if !@bacheca_guida
        @bacheca_guida = BachecaGuida.create()
      end 
    end

    def create
      @bacheca_guida = BachecaGuida.new()
      @bacheca_guida.guida_id = current_user.id
      @bacheca_guida.save()
    end
  end
  