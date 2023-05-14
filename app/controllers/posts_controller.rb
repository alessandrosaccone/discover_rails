#require "google/cloud/translate"

class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ], except: [:all]
  before_action :authenticate_user!
  
  skip_before_action :verify_authenticity_token
  # GET /posts
  def index
    citta = params[:citta]
    lingua = params[:lingua]
    if (citta.present? && lingua.present?)
      @posts = Post.where("nomeC LIKE ?", "%#{params[:citta]}%")
      @posts = @posts.where("lingua LIKE ?", "%#{params[:lingua]}%")
    elsif (!citta.present? && lingua.present?)
      @posts = Post.where("lingua LIKE ?", "%#{params[:lingua]}%")
    elsif (citta.present? && !lingua.present?)
      @posts = Post.where("nomeC LIKE ?", "%#{params[:citta]}%")
    else 
      @posts = Post.all
    end
    @posts.each do |post|
      total_price = (post.prezzo * post.numero_ore / post.persone).to_s+'€'
      ora = post.ora.to_s[11,5]
      data = post.data.to_s[2,8]
      post.instance_variable_set(:@total_price, total_price)
      post.instance_variable_set(:@ora, ora)
      post.instance_variable_set(:@data, data)
    end
    if request.xhr?
      render partial: 'posts_results', locals: { guides: @guides }
    else
      respond_to do |format|
        format.html { render 'index' }
      end
    end
    
 end

  # GET /posts/1
  def show
    @post = Post.find(params[:id])
    @ora = @post.ora.to_s[11,5]
    @data = @post.data.to_s[2,8]
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    persone_to_subtract = params[:post][:persone].to_i
    if @post.persone_rimanenti >= persone_to_subtract
      @post.persone_rimanenti -= persone_to_subtract
      if @post.save
        redirect_to @post, notice: "Post was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to edit_post_path(@post), alert: "Cannot subtract more than available."
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  def get_price
    @post = Post.find(params[:id])
    @price = ((@post.prezzo * @post.numero_ore) / @post.persone).to_i * params[:persone].to_i
    if (@price.to_i <= 0) 
      render json: { error: "Inserisci un numero positivo di persone" }, status: :unprocessable_entity
    elsif (params[:persone].to_i>@post.persone_rimanenti)
      render json: { error: "Inserisci un numero entro il limite di persone" }, status: :unprocessable_entity
    else 
      render json: { price: @price }
    end
  end

  def all
    @posts = Post.all
    render json: @posts 
  end 

def translate_html 
  html_file = File.read("posts.html") #params[:referred]

  translate = Google::Cloud::Translate.new(project_id: "your-project-id",
                                           credentials: "path/to/your/credentials.json")

  target_language = params[:to]
  translated_html = translate.translate(html_file, to: target_language) # Replace "fr" with the target language code

  render html: translated_html
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :published_at, :persone)
    end

end
