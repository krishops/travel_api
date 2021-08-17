class ReviewsController < ApplicationController
  # before_action except: [:update, :destroy] do 
  #   unless  
  #     flash[:alert] = 'You do not have access to this content.'
  #     redirect_to product_path(Product.find(params[:product_id])) 
  #     end
  #   end

  def index
    if country = params[:country]
      @country = Review.country(country)
      # binding.pry
      json_response(@country)
    elsif city = params[:city]
      @city = Review.city(city)
      json_response(@city)
    elsif city = params[:city] && country = params[:country]
      @reviews = Review.search(city, country)
      json_response(@reviews) 
    else
      @review_all = Review.all
      json_response(@review_all)
    end
  end

  def random
    @random = Review.random
    json_response(@random)
  end
  
  def most_popular
    @most_popular = Review.most_reviews
    # binding.pry
    json_response(@most_popular)
  end  

  def show 
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def create
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      render status: 200, json: {
        message: "This review has been succesfully updated"
      }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      render status: 200, json: {
        message: "This review has been deleted"
      }
    end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def review_params
    params.permit(:author, :content, :country, :city)
  end
end