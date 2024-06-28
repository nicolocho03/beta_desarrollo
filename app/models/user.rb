class User < ApplicationRecord
  belongs_to :ubication, class_name: 'Ubication'
  belongs_to :state, class_name: 'GeneralState'
  has_secure_password
end
