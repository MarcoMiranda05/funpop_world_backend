class CollectionsController < ApplicationController

  def index
    collections = Collection.all
    render json: collections.to_json(
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

  def my_collection
    if logged_in
      render json: User.find(current_user[:id]).collections
    else
      render json: {error: "Error fetching your collection"}
    end
  end

  def show
    collection = Collection.find(params[:id])
    render json: collection.to_json(
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
    collection = Collection.new
  end

  def create 
    collection = Collection.new(collection_params)
    if collection.valid?
      collection.save
      render json: collection

    else
      render json: {error: "Sorry was not possible add this Funko to your collection."}
    end
  end

  def edit
    collection = Collection.find(params[:id])
  end

  def update
    collection = Collection.find(params[:id])
    collection.update(collection_params)
    render json: collection
  end

  def destroy
    collections = Collection.all
    collection = Collection.find(params[:id])
    collection.destroy
    render json: collections.to_json(
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

  def collection_params
    params.require(:collection).permit(:funko_id, :user_id, :available_to_trade)
  end

end