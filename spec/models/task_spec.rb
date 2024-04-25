RSpec.describe Task, type: :model do

    describe "validations" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:task_type) }
    end
  
    describe "associations" do
      it { should belong_to(:animal) }
    end
  
    describe "enums" do
      it "defines statuses enum" do
        expect(described_class.statuses).to eq({"needing_attention" => 0, "complete" => 1})
      end
      it "defines task_types enum" do
        expect(described_class.task_types).to eq({"feed" => 0, "bathe" => 1, "socialize" => 2})
      end
    end
  
    describe "mark_task_status" do
        context "when scheduling_interval is present" do
          let(:task) { FactoryBot.create(:task, scheduling_interval: 1.hour) }
    
          it "updates status to needing_attention if interval passed" do
            task.update_attribute(:updated_at, 2.hours.ago)
            task.mark_task_status
            expect(task.reload.status).to eq("needing_attention")
          end
    
          it "returns false if interval hasn't passed" do
            expect(task.mark_task_status).to be_falsey
          end
        end
    
        context "when scheduling_interval is absent" do
          let(:task) { FactoryBot.create(:task, scheduling_interval: nil) }
    
          it "doesn't update status" do
            expect { task.mark_task_status }.not_to change { task.status }
          end
    
          it "returns false" do
            expect(task.mark_task_status).to be_falsey
          end
        end
      end
  end