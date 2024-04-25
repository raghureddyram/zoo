class Animal < ApplicationRecord
    include Notable
    include WithNotes
    
    has_and_belongs_to_many :employees
    belongs_to :primary_habitat, class_name: 'Habitat', foreign_key: 'primary_habitat_id', optional: true
    belongs_to :current_habitat, class_name: 'Habitat', foreign_key: 'current_habitat_id', optional: true

    
    has_many :tasks, dependent: :destroy

    STATUSES = ["healthy", "sick"]

    enum status: STATUSES

    scope :in_habitat, -> { where(current_habitat_id: Animal.select(:primary_habitat_id).where.not(primary_habitat_id: nil)) }

    scope :needing_attention, -> { where(status: "sick") }

    def dietary_requirements
        notes.where(label: "dietary_requirement")
    end

    def habitat_preferences
        notes.where(label: "habitat_preference")
    end

end
