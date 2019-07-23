class FunkosController < ApplicationController

  def index
    funkos = Funko.all 
    render json: funkos.to_json(
      :only => [:id, :name, :fandom, :image_url, :release_date, :item_number, :category]
    )
  end

  def show
    funko = Funko.find(params[:id])
    render json: funko.to_json(
      :only => [:id, :name, :fandom, :image_url, :release_date, :item_number, :category]
    )
  end

  def search
    searchterm = params[:searchterm].downcase
    results = Funko.where('name ILIKE ?', "%#{searchterm}%").or(Funko.where('fandom ILIKE ?', "%#{searchterm}%"))
    render json: results.to_json(
      :only => [:id, :name, :fandom, :image_url, :release_date, :item_number, :category]
    )
  end

end