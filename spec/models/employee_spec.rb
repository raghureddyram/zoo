require 'rails_helper'

RSpec.describe Employee, type: :model do
    describe "validations" do
        it { should validate_presence_of(:first_name) }
        it { should validate_presence_of(:last_name) }
        it { should validate_presence_of(:email) }
        it { should validate_presence_of(:phone) }
    end

    describe "associations" do
        it { should have_and_belong_to_many(:animals) }
        it { should belong_to(:zoological_park) }
    end
end