class Task < ApplicationRecord
    belongs_to :animal
    attribute :scheduling_interval, :interval
    validates_presence_of :name

    enum status: ["incomplete", "needing_attention"]
    enum type: ["feed", "bathe", "socialize"]
end
