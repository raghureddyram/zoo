FactoryBot.define do
  factory :habitat do
    name {""}
    zoological_park {FactoryBot.create(:zoological_park)}
  end
end
