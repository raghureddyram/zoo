FactoryBot.define do
  factory :employee do
    id {""}
    first_name {"Tom"}
    last_name {"New Emp"}
    email {"tom@new.c"}
    phone {"2452342"}
    zoological_park { FactoryBot.create(:zoological_park)}
  end
end
