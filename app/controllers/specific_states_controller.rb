class SpecificStatesController < ApplicationController
  before_action :set_specific_state, only: %i[ show edit update destroy ]
  before_action :set_ubication_states, only: %i[ new edit update destroy create ]

  # GET /specific_states or /specific_states.json
  def index
    @specific_states = SpecificState.all
  end

  # GET /specific_states/1 or /specific_states/1.json
  def show
  end

  # GET /specific_states/new
  def new
    @specific_state = SpecificState.new
  end

  # GET /specific_states/1/edit
  def edit
  end

  # POST /specific_states or /specific_states.json
  def create
    @specific_state = SpecificState.new(specific_state_params)

    respond_to do |format|
      if @specific_state.save
        format.html { redirect_to specific_state_url(@specific_state), notice: "Specific state was successfully created." }
        format.json { render :show, status: :created, location: @specific_state }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @specific_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specific_states/1 or /specific_states/1.json
  def update
    respond_to do |format|
      if @specific_state.update(specific_state_params)
        format.html { redirect_to specific_state_url(@specific_state), notice: "Specific state was successfully updated." }
        format.json { render :show, status: :ok, location: @specific_state }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @specific_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specific_states/1 or /specific_states/1.json
  def destroy
    @specific_state.destroy!

    respond_to do |format|
      format.html { redirect_to specific_states_url, notice: "Specific state was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specific_state
      @specific_state = SpecificState.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def specific_state_params
      params.require(:specific_state).permit(:nombre, :ubication_id)
    end

    def set_ubication_states
      @ubication_states = Ubication.where(nombre: ['SST','Gerencia','Contabilidad'])
    end

end
