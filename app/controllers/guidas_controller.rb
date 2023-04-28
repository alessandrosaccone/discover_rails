class GuidasController < ApplicationController
  before_action :set_guida, only: %i[ show edit update destroy ]

  # GET /guidas
  def index
    @guidas = Guida.all
  end

  # GET /guidas/1
  def show
  end

  # GET /guidas/new
  def new
    @guida = Guida.new
  end

  # GET /guidas/1/edit
  def edit
  end

  # POST /guidas
  def create
    @guida = Guida.new(guida_params)

    if @guida.save
      redirect_to @guida, notice: "Guida was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /guidas/1
  def update
    if @guida.update(guida_params)
      redirect_to @guida, notice: "Guida was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /guidas/1
  def destroy
    @guida.destroy
    redirect_to guidas_url, notice: "Guida was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guida
      @guida = Guida.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guida_params
      params.fetch(:guida, {})
    end
end
