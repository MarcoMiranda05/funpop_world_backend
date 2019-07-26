class WishlistsController < ApplicationController

  def index
    wishlists = Wishlist.all
    render json: render_formart(wishlists)
  end

  def show
    wishlist = Wishlist.find(params[:id])
    render json: render_formart(wishlist)
  end

  def create 
    wishlist = Wishlist.new(wishlist_params)
    if wishlist.valid?
      wishlist.save
      render json: render_formart(wishlist)
    else
      render json: {error: "Sorry was not possible add this Funko to your wishlist."}
    end
  end

  def destroy
    wishlists = Wishlist.all
    wishlist = Wishlist.find(params[:id])
    wishlist.destroy
    render json: render_formart(wishlists)
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:funko_id, :user_id)
  end

  def render_formart(x)
    x.to_json(
      :only => [:id],
      :include => {
        :funko => {
          :except => [:updated_at, :created_at]
        },
        :user => {
          :except => [:updated_at, :created_at, :password_digest]
        }
      }
    )
  end

end
