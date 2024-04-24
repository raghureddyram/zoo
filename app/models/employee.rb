class Employee < ApplicationRecord
    has_and_belongs_to_many :animals
    belongs_to :zoological_park

    def created_notes
        Note.where(creator_id: self.id)
    end
end
