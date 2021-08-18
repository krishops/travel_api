class Review < ApplicationRecord
  validates :author, presence: true
  validates :content, presence: true
  validates :country, presence: true
  validates :city, presence: true

  paginates_per 50
  
  scope :city, -> (city) { where("(city) ilike ?", "%#{city}%")}

  scope :country, -> (country) { where("(country) ilike ?", "%#{country}%")}

  scope :search, -> (city, country) { where("(city) ilike ? AND (country) ilike ?", "%#{city}%", "%#{country}%")}


  scope :most_reviews, -> {(
    select("reviews.city, reviews.country, count(*)").
    group("reviews.city, reviews.country").
    order("count(*) DESC").
    limit(5)
  )}
  
  # scope :random, -> {order('RAND()')}

  scope :random, -> {(
  select("*").
  order("random()").
  limit(1)
  )}
end