class BillsController < ApplicationController
  before_action :set_bill, only: %i[ show edit update destroy edit_compras update_compras edit_gerencia update_gerencia ]
  before_action :set_specific_states, only: %i[new edit create update]
  before_action :set_contabilidad_states, only: %i[new edit create update]
  before_action :set_sst_states, only: %i[new edit create update]
  before_action :set_gerencia_states, only: %i[new edit create update edit_gerencia update_gerencia ]


#Compras, metodos

  def edit_compras 
  end

  def update_compras
    respond_to do |format|
      if @bill.update(bill_params_compras)
        format.html { redirect_to bill_url(@bill), notice: "Factura guardada en compras." }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit_compras, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

#Gerencia

  def edit_gerencia 
  end

  def update_gerencia
    respond_to do |format|
      if @bill.update(bill_params_gerencia)
        format.html { redirect_to bill_url(@bill), notice: "Factura guardada en Gerencia." }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit_gerencia, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end



  
  # GET /bills or /bills.json
  def index
    @bills = Bill.all
  end

  # GET /bills/1 or /bills/1.json
  def show
     @bill = Bill.find(params[:id])
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # GET /bills/1/edit
  def edit
  end

  # POST /bills or /bills.json
  def create
    @bill = Bill.new(bill_initial_params)

    respond_to do |format|
      if @bill.save
        format.html { redirect_to bill_url(@bill), notice: "Factura Creada." }
        format.json { render :show, status: :created, location: @bill }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bills/1 or /bills/1.json
  def update
    respond_to do |format|
      if @bill.update(bill_initial_params)
        format.html { redirect_to @bill, notice: 'Factura actualizada.' }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bills/1 or /bills/1.json
  def destroy
    @bill.destroy!

    respond_to do |format|
      format.html { redirect_to bills_url, notice: "Factura Eliminada." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bill_initial_params
      params.require(:bill).permit(:radicado, :SAO, :numero_factura, :fecha_llegada_recepcion, :tipo_proyecto, :fecha_entrega_compras)
    end

    def bill_params_compras
      params.require(:bill).permit(:fecha_entrega_sst)
    end

    def bill_params_gerencia
      params.require(:bill).permit(:state_gerencia_id)
    end

    #, :fecha_entrega_compras, :fecha_entrega_sst, :fecha_entrega_gerencia, :state_gerencia_id, :fecha_entrega_contabilidad, :state_contabilidad_id, :state_sst_id

    def set_specific_states
      @specific_states = SpecificState.all
    end

    def set_gerencia_states
      @gerencia_states = SpecificState.where(nombre: ['No aprobado','Aprobado'])
    end

    def set_sst_states
      @sst_states = SpecificState.where(nombre: ['No firmado','Firmado'])
    end

    def set_contabilidad_states
      @contabilidad_states = SpecificState.where(nombre: ['Causación', 'Pago'])
    end
end