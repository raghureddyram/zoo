class Habitat < ApplicationRecord
    include Notable
    include WithNotes

    has_many :animals, dependent: :destroy, foreign_key: "primary_habitat_id"
    belongs_to :zoological_park
end
