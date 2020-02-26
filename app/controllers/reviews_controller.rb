class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:create, :new, :show, :edit, :update]
  
  def new
    @review = Review.new

  end

  def create
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant.id)
    else
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
    @restaurant = @review.restaurant
  end

  def update
    @review = Review.find(params[:id])
    @review.update
  end

  private


  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
