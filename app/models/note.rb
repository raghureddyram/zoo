class Note < ApplicationRecord
    belongs_to :notable, polymorphic: true
    belongs_to :secondary_notable, polymorphic: true
    belongs_to :creator, class_name: "Employee", foreign_key: 'creator_id'

    def all_associated
        [creator: creator, notable: notable, secondary_notable: secondary_notable]
    end

    LABELS = ["dietary_requirement", "habitat_preference"]
    
    enum label: LABELS
end