FactoryBot.define do
  factory(:review) do
    author {Faker::FunnyName.name}
    content {Faker::ChuckNorris.fact}
    country {Faker::Address.country}
    city {Faker::Address.city}
  end
end