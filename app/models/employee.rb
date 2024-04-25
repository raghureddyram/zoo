class Employee < ApplicationRecord
    has_and_belongs_to_many :animals
    belongs_to :zoological_park

    def created_notes
        Note.where(creator_id: self.id)
    end

    encrypts :first_name, deterministic: true
    encrypts :last_name, deterministic: true
    encrypts :email, deterministic: true
    encrypts :phone, deterministic: true
end
