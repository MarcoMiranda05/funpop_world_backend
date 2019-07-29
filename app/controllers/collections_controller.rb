class CollectionsController < ApplicationController

  def index
    collections = Collection.all
    render json: render_format(collections)
  end

  def show
    collection = Collection.find(params[:id])
    render json: render_format(collection)
  end

  def create 
    collection = Collection.new(collection_params)
    if collection.valid?
      collection.save
      render json: render_format(collection)
    else
      render json: {error: "Sorry was not possible add this Funko to your collection."}
    end
  end


  def update
    collection = Collection.find(params[:id])
    collection.update(collection_params)
    render json: render_format(collection)
  end

  def destroy
    collections = Collection.all
    collection = Collection.find(params[:id])
    collection.destroy
    render json: render_format(collections)
  end

  def all_funkos_available_to_trade
    availables_to_trade = Collection.where('available_to_trade = ?', true )
    render json: render_format(availables_to_trade)
  end

  def my_funkos_to_trade
    user_id = params[:user_id]
    availables_to_trade = Collection.where('user_id = ?', user_id).&(Collection.where('available_to_trade = ?', true))
    render json: render_format(availables_to_trade)
  end

  def funkos_available_to_trade
    user_id = params[:user_id]
    availables_to_trade = Collection.where('user_id != ?', user_id).&(Collection.where('available_to_trade = ?', true))
    render json: render_format(availables_to_trade)
  end

  

  private

  def collection_params
    params.require(:collection).permit(:funko_id, :user_id, :available_to_trade)
  end

  def render_format(x)
    x.to_json(
      :only => [:id, :available_to_trade],
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