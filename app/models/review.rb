class Review < ApplicationRecord
  validates :author, presence: true
  validates :content, presence: true
  validates :country, presence: true
  validates :city, presence: true

  scope :search, -> { where("country like ?", "%#{country}%")}
end