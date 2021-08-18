class ReviewsController < ApplicationController
  # before_action only: [:update, :destroy] do 
  #   unless params[:user_name] == Review.find(params[:id]).user_name
  #     render status: 401, json: {
  #       message: "Unathorized content"
  #     }
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
      @review_all = Review.page(params[:page])
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
    @user_name = params[:user_name]
    if @user_name == @review.user_name
      if @review.update!(review_params)
        render status: 200, json: {
          message: "This review has been succesfully updated"
      }
      end
    else
      render status: 401, json: {
        message: "Unathorized content"
      }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @user_name = params[:user_name]
    if @user_name == @review.user_name
      if @review.destroy
        render status: 200, json: {
          message: "This review has been deleted"
        }
      end
    else
      render status: 401, json: {
        message: "Unathorized content"
      }
    end
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def review_params
    params.permit(:author, :content, :country, :city, :user_name)
  end
end