class BillsController < ApplicationController
  before_action :set_bill, only: %i[
    show edit update destroy 
    edit_compras update_compras 
    edit_sst update_sst 
    edit_compras_segunda_entrega update_compras_segunda_entrega 
    edit_gerencia update_gerencia 
    edit_contabilidad update_contabilidad_causacion update_contabilidad_pago
  ]
  before_action :set_specific_states, only: %i[new edit create update edit_sst update_sst sst edit_gerencia update_gerencia gerencia]
  before_action :set_contabilidad_states, only: %i[new edit create update contabilidad edit_contabilidad contabilidad_causacion update_contabilidad_causacion contabilidad_pago update_contabilidad_pago ]
  before_action :set_sst_states, only: %i[new edit create update edit_sst update_sst sst]
  before_action :set_gerencia_states, only: %i[new edit create update edit_gerencia update_gerencia gerencia]
  before_action :authenticate_user!
  before_action :check_access_recepcion, only: [:new , :create]
  before_action :check_access_compras, only: [:edit_compras]
  before_action :check_access_sst, only: [:sst, :edit_sst]
  before_action :check_access_gerencia, only: [:gerencia, :edit_gerencia]
  before_action :check_access_contabilidad, only: [:contabilidad, :edit_contabilidad]


  #Metodos para la logica basica de facturas, son necesarios para la visualizacion de cada una
  #creacion, editar y eliminar.

  def search
    @query = params[:query]
    if @query.present?
      @bills = Bill.joins(:ubication, :general_state).where('bills.numero_factura LIKE ? OR ubications.nombre LIKE ? OR general_states.nombre LIKE ?', "%#{@query}%", "%#{@query}%", "%#{@query}%")
    else
      @bills = Bill.none
    end
  end
  
  def index
    @bills = Bill.all
  end

  def show
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_initial_params)
    @bill.ubication_id = current_user.ubication_id
    
    provider = Provider.find_by(nit: params[:nit])
    
    if provider
      @bill.provider_id = provider.id
    else
      flash.now[:alert] = "Proveedor con NIT #{params[:nit]} no encontrado."
      return render :new
    end
  
    if current_user.state_id == 1 
      @bill.state_id = GeneralState.find_by(nombre: 'Obra').id
      @bill.to_compras!
    else
      @bill.state_id = GeneralState.find_by(nombre: 'Oficina').id
      @bill.to_contabilidad_causacion!
    end
  
    @bill.ubication_id = Ubication.find_by(nombre: 'Recepcion').id
  
    if @bill.save
      redirect_to @bill, notice: 'Factura creada y enviada correctamente al siguiente proceso.'
    else
      render :new
    end
  end
  

  def edit
  end

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

  def destroy
    @bill.destroy!
    respond_to do |format|
      format.html { redirect_to bills_url, notice: "Factura eliminada." }
      format.json { head :no_content }
    end
  end

  #Metodos para el proceso de facturas.

  #Proceso en el area de compras, y segunda entrega de compras

  def compras
    @bills = Bill.where(aasm_state: [:compras, :compras_segunda_entrega])
  end

  def send_to_compras
    if @bill.to_compras! && @bill.update(bill_params_compras)
      redirect_to bills_path, notice: "Factura enviada a compras exitosamente."
    else
      render :sst, alert: "No se pudo enviar la factura a compras."
    end
  end

  def compras
    @bills = Bill.where(aasm_state: :compras)
  end

  def edit_compras
  end

  def update_compras
    if @bill.update(bill_params_compras)
      @bill.to_sst!
      redirect_to bill_url(@bill), notice: "Factura guardada en compras y enviada a SST."
    else
      render :edit_compras, status: :unprocessable_entity
    end
  end

  def update_compras_segunda_entrega
    if @bill.update(bill_params_compras_segunda_entrega)
      @bill.to_gerencia!
      redirect_to bill_url(@bill), notice: "Factura guardada en compras y enviada a Gerencia."
    else
      render :edit_compras_segunda_entrega, status: :unprocessable_entity
    end
  end

  def edit_compras_segunda_entrega
  end

  def update_compras_segunda_entrega
    respond_to do |format|
      if @bill.update(bill_params_compras_segunda_entrega) && @bill.to_gerencia!
        format.html { redirect_to @bill, notice: "Factura guardada en Compras y enviada a Gerencia." }
        format.json { render :show, status: :ok, location: @bill }
      else
        format.html { render :edit_compras_segunda_entrega, status: :unprocessable_entity }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #Metodos del area de SST
  def sst
    @bills = Bill.where(aasm_state: :sst)
  end

  def update_sst
    @bill = Bill.find(params[:id])
    if @bill.update(bill_params_sst)
      @bill.to_compras_segunda_entrega!
      redirect_to sst_bills_path, notice: "Factura actualizada y enviada a Compras nuevamente."
    else
      render :sst
    end
  end

  def send_to_sst
    if @bill.to_sst! && @bill.update(bill_params_compras)
      redirect_to bills_path, notice: "Factura enviada a SST exitosamente."
    else
      render :compras, alert: "No se pudo enviar la factura a SST."
    end
  end

  def edit_sst
  end

  def update_sst
    if @bill.update(bill_params_sst)
      @bill.to_compras_segunda_entrega!
      redirect_to sst_bills_path, notice: "Factura actualizada y enviada a Compras nuevamente."
    else
      render :edit_sst
    end
  end

  # Metodos en el area de Gerencia

  def gerencia 
    @bills = Bill.where(aasm_state: :gerencia)
  end

  def edit_gerencia
  end

  def update_gerencia
    @bill = Bill.find(params[:id])
  
    if @bill.update(bill_params_gerencia)
      case current_user.state_id
      when 1
        if @bill.aasm_state == 'gerencia'
          @bill.to_contabilidad_causacion_from_gerencia!
          redirect_to gerencia_bills_path, notice: 'Factura actualizada y enviada a causación de obra.'
        else
          @bills = Bill.where(state_gerencia_id: 1)
          render :gerencia
        end
      when 2
        if @bill.aasm_state == 'gerencia'
          @bill.to_contabilidad_from_gerencia!
          redirect_to gerencia_bills_path, notice: 'Factura actualizada y enviada a pago de oficina.'
        else
          @bills = Bill.where(state_gerencia_id: 2)
          render :gerencia
        end
      else
        @bills = Bill.none
        render :gerencia, alert: 'No tienes permisos para ver facturas en esta sección.'
      end
    else
      @bills = Bill.where(state_gerencia_id: current_user.state_id)
      render :gerencia, alert: 'No se pudo actualizar la factura.'
    end
  end
  


  def send_to_gerencia
    if @bill.to_gerencia! && @bill.update(bill_params_compras)
      redirect_to bills_path, notice: "Factura enviada a Gerencia."
    else
      render :compras, alert: "No se pudo enviar la factura a Gerencia."
    end
  end
  

  # Metodos en el area de Contabilidad

  def contabilidad
    @bills = Bill.where(aasm_state: :contabilidad)
  end

  def contabilidad_pago
    @bills = Bill.where(aasm_state: :contabilidad_pago)
  end

  def edit_contabilidad
  end


  def contabilidad_causacion
    @bills = if current_user.state_id == 1
               Bill.where(aasm_state: 'gerencia')
               Bill.where(aasm_state: 'contabilidad_causacion')
             else
               Bill.where(aasm_state: 'contabilidad_causacion')
             end
  end

  def update_contabilidad_causacion
    @bill = Bill.find(params[:bill_id])
    
    if @bill.update(bill_params_contabilidad)
      case current_user.state_id
      when 1
        if @bill.aasm_state == 'contabilidad_causacion'
          @bill.to_contabilidad_pago!
          redirect_to contabilidad_causacion_bills_path, notice: 'Factura actualizada y enviada a estado Pago.'
        else
          render :contabilidad_causacion
        end
      when 2
        if @bill.aasm_state == 'contabilidad_causacion'
          @bill.to_gerencia_from_contabilidad!
          redirect_to contabilidad_causacion_bills_path, notice: 'Factura actualizada y enviada a Gerencia'
        else
          render :contabilidad_causacion
        end
      else
        render :contabilidad_causacion
      end
    else
      render :contabilidad_causacion
    end
  end

  def update_contabilidad_pago
    if @bill.update(bill_params_contabilidad)
      redirect_to contabilidad_pago_bills_path, notice: 'Factura actualizada correctamente.'
    else
      render :edit_contabilidad_pago
    end
  end

  #Metodos en private

  private

  #Metodos de basicos de Bills(Facturas)
  def set_bill
    @bill = Bill.find(params[:bill_id] || params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to bills_path, alert: "Factura no encontrada."
  end

  def bill_initial_params
    params.require(:bill).permit(:radicado, :SAO, :numero_factura, :fecha_llegada_recepcion, :tipo_proyecto, :fecha_entrega_compras, :fecha_entrega_contabilidad, :provider_id)
  end

  #Metodos de compras y compras segunda entrega
  def bill_params_compras
    params.require(:bill).permit(:fecha_entrega_sst)
  end

  def bill_params_compras_segunda_entrega
    params.require(:bill).permit(:fecha_entrega_gerencia)
  end
  
  #Metodos SST
  def bill_params_sst
    params.require(:bill).permit(:compras_segunda_fecha, :state_sst_id)
  end

  #Metodos Gerencia
  def bill_params_gerencia
    params.require(:bill).permit(:state_gerencia_id, :fecha_entrega_contabilidad)
  end

  #Metodos Contabilidad
  def bill_params_contabilidad
    params.require(:bill).permit(:bill_id, :state_contabilidad_id, :fecha_entrega_contabilidad, :fecha_entrega_gerencia)
  end


  

  #Los siguientes metodos se encargan de los estados que tienen las facturas en cada ubicación.
  
  def set_specific_states
    @specific_states = SpecificState.all
  end

  #Estados SST
  def set_sst_states
    @sst_states = SpecificState.where(nombre: ['No firmado', 'Firmado'])
  end

  #Estados Gerencia
  def set_gerencia_states
    @gerencia_states = SpecificState.where(nombre: ['No aprobado', 'Aprobado'])
  end

  #Estados Contabilidad
    def set_contabilidad_states
      @contabilidad_states = SpecificState.where(nombre: ['Causación', 'Pago'])
    end 

  #Los siguientes metodos validan el acceso del usuario a las diferentes vistas.

  #Validación Recepción 
  def check_access_recepcion
    redirect_to root_path, alert: "No tienes permiso para acceder a esta página" unless current_user&.ubication_id == 1
  end

  #Validación Compras
  def check_access_compras
    redirect_to root_path, alert: 'No tienes permiso para acceder a esta vista.' unless current_user && current_user.ubication_id == 2
  end

  #Validación SST
  def check_access_sst
    redirect_to root_path, alert: 'No tienes permiso para acceder a esta vista.' unless current_user&.ubication_id == 3
  end

  #Validación Gerencia
  def check_access_gerencia
    redirect_to root_path, alert: 'No tienes permiso para acceder a esta vista.' unless current_user&.ubication_id == 4
  end

  #Validación Contabilidad
  def check_access_contabilidad
    redirect_to root_path, alert: 'No tienes permiso para acceder a esta vista.' unless current_user&.ubication_id == 5
  end
end