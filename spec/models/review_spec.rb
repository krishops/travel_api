require 'rails_helper'

describe Review do
  it {should validate_presence_of :content}
  it {should validate_presence_of :author}
  it {should validate_presence_of :country}
  it {should validate_presence_of :city}

  it 'creates a review' do
    review = FactoryBot.create(:review)
    expect(review.author).to eq review.author
  end

end