require 'rails_helper'

RSpec.describe Note, type: :model do
  describe "associations" do
    it { should belong_to(:notable) }
    it { should belong_to(:secondary_notable) }
    it { should belong_to(:creator).class_name('Employee').with_foreign_key('creator_id') }
  end

  describe "#all_associated" do
    let(:employee) { instance_double(Employee)}
    let(:notable) { instance_double(Habitat)}
    let(:note) { instance_double(Note, creator: employee, notable: notable) }
   


    it "returns a hash with creator, notable, and secondary_notable" do
      allow(note).to receive(:creator).and_return(employee)
      allow(note).to receive(:notable).and_return(notable)
      allow(note).to receive(:secondary_notable).and_return(nil)
      allow(note).to receive(:all_associated).and_return({creator: note.creator, notable: note.notable, secondary_notable: nil})
    
      expect(note.all_associated).to eq({creator: employee, notable: notable, secondary_notable: nil})
    end
  end

  describe "enum label" do
    it "has labels for dietary_requirement and habitat_preference" do
      expect(Note.labels).to eq({"dietary_requirement" => 0, "habitat_preference" => 1})
    end
  end
end
