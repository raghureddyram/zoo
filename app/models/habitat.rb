class Habitat < ApplicationRecord
    include Notable
    include WithNotes

    has_many :animals, dependent: :destroy
    belongs_to :zoological_park


    
end
