RSpec.describe ZoologicalPark, type: :model do

    describe "validations" do
        it { should have_many(:habitats) }
    end
  
  end