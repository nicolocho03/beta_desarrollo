class Bill < ApplicationRecord
  belongs_to :state_gerencia, class_name: 'SpecificState', optional: true
  belongs_to :state_contabilidad, class_name: 'SpecificState',optional: true
  belongs_to :state_sst, class_name: 'SpecificState',optional: true
end
