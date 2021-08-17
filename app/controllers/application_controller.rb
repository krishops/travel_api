class ApplicationController < ActionController::API
  include Response

rescue_from ActiveRecord::RecordNotFound do |exception|
  json_response({message: exception.message}, :not_found)
end

rescue_from ActiveRecord::RecordInvalid do |exception|
  json_response({message: exception.message}, :unprocessable_entity)
end

# helper_method [:is_author?]

#   def is_author?
#     Review.find(params[:id]).user == current_user
#   end

end