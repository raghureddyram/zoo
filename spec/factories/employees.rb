FactoryBot.define do
  factory :employee do
    id {""}
    first_name {""}
    last_name {""}
    email {""}
    phone {""}
    zoological_park { FactoryBot.create(:zoological_park)}
  end
end
