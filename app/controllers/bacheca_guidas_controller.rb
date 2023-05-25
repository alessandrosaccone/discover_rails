class BachecaGuidasController < ApplicationController
  def show
    @bacheca_guida = BachecaGuida.find_or_initialize_by(user_id: current_user.id)

    if @bacheca_guida.new_record?
      @bacheca_guida.save
    end

    @name = User.where(id: current_user.id).first.name

    # Altri codici per la visualizzazione della bacheca guida
  end

  def edit
    @bacheca_guida = BachecaGuida.find(params[:id])
  end

  def update
    @bacheca_guida = BachecaGuida.find(params[:id])
    if @bacheca_guida.update(bacheca_params)
      redirect_to show_bacheca_path, notice: "Board updated successfully"
    end
  end

  private
  def bacheca_params
    params.require(:bacheca_guida).permit(:description)
  end
end
