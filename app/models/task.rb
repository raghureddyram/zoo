class Task < ApplicationRecord
    belongs_to :animal
    attribute :scheduling_interval, :interval
    validates_presence_of :name
    validates_presence_of :type

    enum status: ["incomplete", "needing_attention"]
    enum type: ["feed", "bathe", "socialize"]


    def mark_task_status
        return unless self.scheduling_interval.present?
        now = Time.zone.now 
        self.current_interval = now - self.updated_at
        if current_interval > self.scheduling_interval
            self.status = "needing_attention"
            self.save
        end
    end
end
