class Bill < ApplicationRecord
  include AASM

  belongs_to :state_gerencia, class_name: 'SpecificState', optional: true
  belongs_to :state_contabilidad, class_name: 'SpecificState',optional: true
  belongs_to :state_sst, class_name: 'SpecificState',optional: true
  belongs_to :ubication
  belongs_to :general_state, class_name: 'GeneralState', foreign_key: 'state_id'

  validates :ubication_id, presence: true
  validates :state_id, presence: true

  aasm column: 'aasm_state' do
    state :recepcion, initial: true
    state :compras
    state :sst
    state :gerencia
    state :contabilidad

    event :to_compras do
      transitions from: :recepcion, to: :compras
    end

    event :to_sst do
      transitions from: :compras, to: :sst
    end

    event :to_compras_segunda_entrega do
      transitions from: :sst, to: :compras
    end

    event :to_gerencia do
      transitions from: :compras, to: :gerencia
    end

    event :to_contabilidad do
      transitions from: :gerencia, to: :contabilidad
    end
  end
  
end
