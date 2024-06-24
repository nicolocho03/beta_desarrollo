class GeneralStatesController < ApplicationController
  before_action :set_general_state, only: %i[ show edit update destroy ]

  # GET /general_states or /general_states.json
  def index
    @general_states = GeneralState.all
  end

  # GET /general_states/1 or /general_states/1.json
  def show
  end

  # GET /general_states/new
  def new
    @general_state = GeneralState.new
  end

  # GET /general_states/1/edit
  def edit
  end

  # POST /general_states or /general_states.json
  def create
    @general_state = GeneralState.new(general_state_params)

    respond_to do |format|
      if @general_state.save
        format.html { redirect_to general_state_url(@general_state), notice: "General state was successfully created." }
        format.json { render :show, status: :created, location: @general_state }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @general_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /general_states/1 or /general_states/1.json
  def update
    respond_to do |format|
      if @general_state.update(general_state_params)
        format.html { redirect_to general_state_url(@general_state), notice: "General state was successfully updated." }
        format.json { render :show, status: :ok, location: @general_state }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @general_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /general_states/1 or /general_states/1.json
  def destroy
    @general_state.destroy!

    respond_to do |format|
      format.html { redirect_to general_states_url, notice: "General state was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_state
      @general_state = GeneralState.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def general_state_params
      params.require(:general_state).permit(:nombre)
    end
end
