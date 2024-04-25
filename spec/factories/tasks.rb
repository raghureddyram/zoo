FactoryBot.define do
  factory :task do
    scheduling_interval { 1.minute }
    updated_at { 2.minutes.ago }
    task_type {"feed"}
    status {"complete"} 
    animal { Animal.new }
    name {"sample"}
  end
end
