class Employee < ApplicationRecord
    has_and_belongs_to_many :animals
    has_many :notes
    belongs_to :zoological_park
end
