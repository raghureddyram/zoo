class Habitat < ApplicationRecord
    include Notable
    include WithNotes

    has_many :animals
    belongs_to :zoological_park


    
end
