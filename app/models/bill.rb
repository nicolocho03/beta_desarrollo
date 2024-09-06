class Bill < ApplicationRecord
  include AASM

  belongs_to :state_gerencia, class_name: 'SpecificState', optional: true
  belongs_to :state_contabilidad, class_name: 'SpecificState', optional: true
  belongs_to :state_sst, class_name: 'SpecificState', optional: true
  belongs_to :ubication
  belongs_to :project_type
  belongs_to :general_state, class_name: 'GeneralState', foreign_key: 'state_id'
 
  validates :ubication_id, presence: true
  validates :state_id, presence: true

  aasm column: 'aasm_state' do
    state :recepcion, initial: true
    state :compras
    state :sst
    state :gerencia
    state :contabilidad
    state :contabilidad_causacion
    state :contabilidad_pago

    event :to_compras do
      transitions from: :recepcion, to: :compras
    end

    event :to_sst do
      transitions from: :compras, to: :sst
    end

    event :to_sst_from_recepcion do
      transitions from: :recepcion, to: :sst
    end 

    event :to_compras_from_sst do
      transitions from: :sst, to: :compras
    end

    event :to_gerencia do
      transitions from: :compras, to: :gerencia
    end
  
    event :to_contabilidad_causacion_from_gerencia do
      transitions from: :gerencia, to: :contabilidad_causacion
    end

    event :to_contabilidad_causacion do
      transitions from: :recepcion, to: :contabilidad_causacion
    end

    event :to_contabilidad_pago do
      transitions from: :contabilidad_causacion, to: :contabilidad_pago
    end

    event :to_gerencia_from_contabilidad do
      transitions from: :contabilidad_causacion, to: :gerencia
    end

    event :to_contabilidad_from_gerencia do
      transitions from: :gerencia, to: :contabilidad_pago
    end
  end
end

