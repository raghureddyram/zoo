class Employee < ApplicationRecord
    has_and_belongs_to_many :animals
    belongs_to :zoological_park
    
    validates_presence_of :first_name
    validates_presence_of :last_name
    validates_presence_of :email
    validates_presence_of :phone

    def created_notes
        Note.where(creator_id: self.id)
    end

    encrypts :first_name, deterministic: true
    encrypts :last_name, deterministic: true
    encrypts :email, deterministic: true
    encrypts :phone, deterministic: true
end
