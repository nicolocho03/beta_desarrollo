class UbicationsController < ApplicationController
  before_action :set_ubication, only: %i[ show edit update destroy ]

  # GET /ubications or /ubications.json
  def index
    @ubications = Ubication.all
  end

  # GET /ubications/1 or /ubications/1.json
  def show
  end

  # GET /ubications/new
  def new
    @ubication = Ubication.new
  end

  # GET /ubications/1/edit
  def edit
  end

  # POST /ubications or /ubications.json
  def create
    @ubication = Ubication.new(ubication_params)

    respond_to do |format|
      if @ubication.save
        format.html { redirect_to ubication_url(@ubication), notice: "Ubication was successfully created." }
        format.json { render :show, status: :created, location: @ubication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ubication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ubications/1 or /ubications/1.json
  def update
    respond_to do |format|
      if @ubication.update(ubication_params)
        format.html { redirect_to ubication_url(@ubication), notice: "Ubication was successfully updated." }
        format.json { render :show, status: :ok, location: @ubication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ubication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ubications/1 or /ubications/1.json
  def destroy
    @ubication.destroy!

    respond_to do |format|
      format.html { redirect_to ubications_url, notice: "Ubication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ubication
      @ubication = Ubication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ubication_params
      params.require(:ubication).permit(:nombre)
    end
end
