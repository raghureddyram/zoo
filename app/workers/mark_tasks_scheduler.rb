require 'sidekiq-scheduler'

class MarkTasksScheduler
    include Sidekiq::Worker

    def perform
        puts "Starting MarkTasksScheduler!!"
        Task.all.each do |task|
            puts "Preparing for task id: #{task.id}"
            res = task.mark_task_status
          if res
            puts "Task marked needing_attention, id: #{task.id}"
          end
        end
    end
end