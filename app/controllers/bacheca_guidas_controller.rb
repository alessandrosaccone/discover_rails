class BachecaGuidasController < ApplicationController
    def show
      @bacheca_guida = BachecaGuida.find(params[:id])
    end

    def create
    end
  end
  