class TuristasController < ApplicationController
  before_action :set_turista, only: %i[ show edit update destroy ]

  # GET /turistas
  def index
    @turistas = Turistas.all
  end

  # GET /turistas/1
  def show
  end

  # GET /turistas/new
  def new
    @turista = Turistas.new
  end

  # GET /turistas/1/edit
  def edit
  end

  # POST /turistas
  def create
    @turista = Turistas.new(turista_params)

    if @turista.save
      redirect_to @turista, notice: "Turistas was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /turistas/1
  def update
    if @turista.update(turista_params)
      redirect_to @turista, notice: "Turistas was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /turistas/1
  def destroy
    @turista.destroy
    redirect_to turistas_index_url, notice: "Turistas was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turista
      @turista = Turistas.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def turista_params
      params.fetch(:turista, {})
    end
end
