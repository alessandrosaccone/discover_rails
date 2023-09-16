class BachecaGuidasController < ApplicationController
  before_action :authenticate_user!
  require 'geonames'
  def show
    session[:index] = 0
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
  
  def index_for_post
    @index = session[:index] || 0
  
    posts = Post.where(user_id: current_user.id).order(created_at: :desc).limit(10).offset(@index)
  
    render json: posts
  
    session[:index] = @index + 10
  end  

  def show_for_others 
    @bacheca_guida = BachecaGuida.find_by(user_id: params[:user_id])
    @other_user = User.find(params[:user_id])
    @posts = Post.where(user_id: params[:user_id])
  end 

  private

  def bacheca_params
    params.require(:bacheca_guida).permit(:description)
  end

end
