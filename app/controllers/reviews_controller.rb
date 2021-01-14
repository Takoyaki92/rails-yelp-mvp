class ReviewsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = Review.all
  end

  # def show
  #   @restaurant = Restaurant.find(params[:id])
  # end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new

  end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    # redirect_to restaurant_path(@restaurant)
     if @review.save
        redirect_to restaurant_path(@restaurant)
      else
        render :new
      end
    end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
