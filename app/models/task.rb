class Task < ApplicationRecord
    belongs_to :animal
    attribute :scheduling_interval, :interval
    validates_presence_of :name
    validates_presence_of :task_type

    STATUSES = ["needing_attention", "complete"]
    TYPES = ["feed", "bathe", "socialize"]

    enum status: STATUSES
    enum task_type: TYPES


    def mark_task_status
        return unless self.scheduling_interval.present?

        current_interval = Time.zone.now  - self.updated_at
        if current_interval > self.scheduling_interval
            self.status = "needing_attention"
            return self.save
        else
            false
        end
    end
end
