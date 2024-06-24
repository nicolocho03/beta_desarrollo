class User < ApplicationRecord
  belongs_to :ubication, class_name: 'Ubication'
  belongs_to :state, class_name: 'GeneralState'
end
