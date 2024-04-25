class ZoologicalPark < ApplicationRecord
    has_many :habitats, dependent: :destroy
end
