# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# class Seed

#   def self.begin
#     seed = Seed.new
#     seed.generate_reviews
#   end
Review.destroy_all

  review_list = [
    ["Kristen", "test review 1", "Portland", "USA"],
    ["Kristen", "test review 2", "Portland", "USA"],
    ["Kristen", "test review 3", "Portland", "USA"],
    ["Kristen", "test review 4", "Dallas", "USA"],
    ["Kristen", "test review 5", "Dallas", "USA"],
    ["Kristen", "test review 6", "Vancouver", "Canada"],
    ["Kristen", "test review 7", "Vancouver", "Canada"],
    ["Kristen", "test review 8", "Victoria", "Canada"],
    ["Kristen", "test review 9", "Victoria", "Canada"],
    ["Kristen", "test review 10", "Victoria", "Canada"],
    ["Kristen", "test review 11", "Victoria", "Canada"],
  ]

  review_list.each do |author, content, city, country|
    Review.create(author: author, content: content, city: city, country: country)
  # def generate_reviews
  #   20.times do |i|
  #     review = Review.create!(
  #       author: Faker::FunnyName.name,
  #       content: Faker::ChuckNorris.fact,
  #       country: Faker::Address.country,
  #       city: Faker::Address.city 
  #     )
      # puts "review #{i}: Author is #{review.author} and review is '#{review.content}' of #{review.city}, #{review.country}."
    end
  
#   end
# end

# Seed.begin