class Review < ApplicationRecord
  validates :author, presence: true
  validates :content, presence: true
  validates :country, presence: true
  validates :city, presence: true
  
  
  
  scope :city, -> (city) { where("(city) ilike ?", "%#{city}%")}

  scope :country, -> (country) { where("(country) ilike ?", "%#{country}%")}

  scope :search, -> (city, country) { where("(city) ilike ? AND (country) ilike ?", "%#{city}%", "%#{country}%")}


  # scope :most_reviews, -> {(
  #   select("reviews.city, reviews.country, count(reviews.id) as reviews_count")
  #   # .joins(:reviews)
  #   .group("reviews.id")
  #   .order("reviews_count DESC")
  #   .limit(10)
  # )}


end