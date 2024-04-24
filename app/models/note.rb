class Note < ApplicationRecord
    belongs_to :notable, polymorphic: true
    belongs_to :creator, class_name: "Employee", foreign_key: 'creator_id'

    # need schema validator for before habitat_preference save
    
    enum label: ["dietary_requirement", "habitat_preference", "employee_note"]
end