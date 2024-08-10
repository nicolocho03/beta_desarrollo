class Ubication < ApplicationRecord
    has_many :users
    has_many :bills
end
