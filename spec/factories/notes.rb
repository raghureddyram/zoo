FactoryBot.define do
  factory :note do
    creator { FactoryBot.create(:employee) }
    notable {FactoryBot.create(:animal)}
    secondary_notable {FactoryBot.create(:animal)}
  end
end
