class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :dashboard, :favorite, :unfavorite, :like, :unlike]
  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all
  end

  def show
    @comment = Comment.new
  end

  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

  def ranking
    @restaurants = Restaurant.order(favorites_count: :desc).limit(10)
  end

  def dashboard
  end

  def favorite
    #create relations (user_id and restaurant_id)
    @restaurant.favorites.create!(user: current_user)
    #back to last the page with default page

    redirect_back(fallback_location: root_path)
  end

  def unfavorite
    favorite = Favorite.where(restaurant: @restaurant, user: current_user).first
    favorite.destroy

    redirect_back(fallback_location: root_path)
  end

  def like
    #create relations (user_id and restaurant_id)
    @restaurant.likes.create!(user: current_user)
    #back to last the page with default page
    redirect_back(fallback_location: root_path)
  end

  def unlike
    likes = Like.where(restaurant: @restaurant, user: current_user).first
    likes.destroy
    redirect_back(fallback_location: root_path)
  end

  private

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
end

