class GeneralState < ApplicationRecord
    has_many :users
    has_many :bills
end
