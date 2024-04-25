namespace :batch do
  desc "Marking task on an interval"
  task check_tasks: :environment do
    Task.all.each do |task|
      res = task.mark_task_status
      if res
        puts "Task marked needing_attention, id: #{task.id}"
      end
    end
  end
end

