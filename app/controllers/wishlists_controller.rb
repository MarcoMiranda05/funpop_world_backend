class WishlistsController < ApplicationController

  def index
    wishlists = Wishlist.all
    render json: wishlists.to_json(
      :except => [:updated_at, :created_at],
      :include => {
        :funko => {
          :except => [:updated_at, :created_at]
        },
        :user => {
          :only => [:username, :city, :country, :email, :pic_url]
        }
      }
    )
  end

  def show
    wishlist = Wishlist.find(params[:id])
    render json: wishlist.to_json(
      :except => [:updated_at, :created_at],
      :include => {
        :funko => {
          :except => [:updated_at, :created_at]
        },
        :user => {
          :only => [:username, :city, :country, :email, :pic_url]
        }
      }
    )
  end

  def new
    wishlist = Wishlist.new
  end

  def create 
    wishlist = Wishlist.new(wishlist_params)
    if wishlist.valid?
      wishlist.save
      render json: wishlist

    else
      render json: {error: "Sorry was not possible add this Funko to your wishlist."}
    end
  end

  def edit
    wishlist = Wishlist.find(params[:id])
  end

  def update
    wishlist = Wishlist.find(params[:id])
    wishlist.update(wishlist_params)
    render json: wishlist
  end

  def destroy
    wishlists = Wishlist.all
    wishlist = Wishlist.find(params[:id])
    wishlist.destroy
    render json: wishlists.to_json(
      :except => [:updated_at, :created_at],
      :include => {
        :funko => {
          :except => [:updated_at, :created_at]
        },
        :user => {
          :only => [:username, :city, :country, :email, :pic_url]
        }
      }
    )
  end

  private

  def wishlist_params
    params.require(:wishlist).permit(:funko_id, :user_id)
  end

end
