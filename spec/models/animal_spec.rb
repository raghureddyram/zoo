require 'rails_helper'

RSpec.describe Animal, type: :model do
    describe "associations" do
        it { should have_and_belong_to_many(:employees) }
        it { should belong_to(:primary_habitat).class_name('Habitat').optional }
        it { should belong_to(:current_habitat).class_name('Habitat').optional }
        it { should have_many(:tasks).dependent(:destroy) }
    end

    describe "enums" do
        it "defines statuses enum" do
            expect(described_class.statuses).to eq({"healthy" => 0, "sick" => 1})
        end
    end
end