class Animal < ApplicationRecord
    has_and_belongs_to_many :employees
    belongs_to :primary_habitat, class_name: 'Habitat', foreign_key: 'primary_habitat_id', optional: true
    belongs_to :current_habitat, class_name: 'Habitat', foreign_key: 'current_habitat_id', optional: true

    include Notable
    include WithNotes
end
