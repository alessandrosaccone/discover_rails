class PostaController < ApplicationController
  before_action :set_postum, only: %i[ show edit update destroy ]

  # GET /posta
  def index
    @posta = Postum.all
  end

  # GET /posta/1
  def show
  end

  # GET /posta/new
  def new
    @postum = Postum.new
  end

  # GET /posta/1/edit
  def edit
  end

  # POST /posta
  def create
    @postum = Postum.new(postum_params)

    if @postum.save
      redirect_to @postum, notice: "Postum was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posta/1
  def update
    if @postum.update(postum_params)
      redirect_to @postum, notice: "Postum was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posta/1
  def destroy
    @postum.destroy
    redirect_to posta_url, notice: "Postum was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postum
      @postum = Postum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def postum_params
      params.fetch(:postum, {})
    end
end
