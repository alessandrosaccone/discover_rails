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

    if(params[:increment] == 'true')
      session[:show_for_others_idx] += 50

    else
      session[:show_for_others_idx] = 0

    end

    if request.xhr?
      @index = session[:show_for_others_idx]
      citta = params[:citta]
      lingua = params[:lingua]

      if (citta.present? && lingua.present?)
        @posts = Post.where("nomeC LIKE ?", "%#{params[:citta]}%").where("lingua LIKE ?", "%#{params[:lingua]}%").where(user_id: params[:user_id])
      elsif (!citta.present? && lingua.present?)
        @posts = Post.where("lingua LIKE ?", "%#{params[:lingua]}%").where(user_id: params[:user_id])
      elsif (citta.present? && !lingua.present?)
        @posts = Post.where("nomeC LIKE ?", "%#{params[:citta]}%").where(user_id: params[:user_id])
      else  
        @posts = Post.where(user_id: params[:user_id])
      end

      if(params[:expired] == '1')

        @posts = @posts.where(status: 'expired')

      end

      if(params["date(1i)"] != '' && params["date(2i)"] == '' && params["date(3i)"] == '')
        @posts = @posts.where("STRFTIME('%Y', data) = ?","#{params["date(1i)"]}")
      elsif(params["date(1i)"] != '' && params["date(2i)"] != '' && params["date(3i)"] == '')
        month = '%02d' % params["date(2i)"]
        @posts = @posts.where("STRFTIME('%Y %m', data) = ?", "#{params["date(1i)"]} #{month}")
      elsif(params["date(1i)"] != '' && params["date(2i)"] != '' && params["date(3i)"] != '')
        month = '%02d' % params["date(2i)"]
        day = '%02d' % params["date(3i)"]
        @posts = @posts.where("STRFTIME('%Y %m %d', data) = ?", "#{params["date(1i)"]} #{month} #{day}")
      end

      @posts = @posts.limit(50).offset(@index)

      @posts.each do |post|
        total_price = (post.prezzo * post.numero_ore / post.persone).to_s+'€'
        ora = post.ora.to_s[11,5]
        data = post.data.to_s[2,8]
        post.instance_variable_set(:@total_price, total_price)
        post.instance_variable_set(:@ora, ora)
        post.instance_variable_set(:@data, data)
      end

      render partial: 'show_posts', locals: { posts: @posts }

    else
      @index = session[:show_for_others_idx]
      @bacheca_guida = BachecaGuida.find_by(user_id: params[:user_id])
      @other_user = User.find(params[:user_id])
      @posts = Post.where(user_id: params[:user_id]).limit(50).offset(@index)

      @posts.each do |post|
        total_price = (post.prezzo * post.numero_ore / post.persone).to_s+'€'
        ora = post.ora.to_s[11,5]
        data = post.data.to_s[2,8]
        post.instance_variable_set(:@total_price, total_price)
        post.instance_variable_set(:@ora, ora)
        post.instance_variable_set(:@data, data)
      end

      respond_to do |format|
        format.html { render 'show_for_others' }
      end
      
    end

  end 


  private

  def bacheca_params
    params.require(:bacheca_guida).permit(:description, :date)
  end
  

end
