FactoryGirl.define do
  factory :project do
    name { Faker::Name.first_name }
    body { Faker::Lorem.paragraph(1) }
    designation "mobile"
  end
end
