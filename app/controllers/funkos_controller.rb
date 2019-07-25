class FunkosController < ApplicationController

  def index
    funkos = Funko.all 
    render json: funkos.to_json(
      :except => [:created_at, :updated_at]
    )
  end

  def show
    funko = Funko.find(params[:id])
    render json: funko.to_json(
      :except => [:created_at, :updated_at]
    )
  end

  def search
    searchterm = params[:searchterm].downcase
    results = Funko.where('name ILIKE ?', "%#{searchterm}").or(Funko.where('fandom ILIKE ?', "%#{searchterm}"))
    render json: results.to_json(
      :except => [:created_at, :updated_at]
    )
  end

  def category
    searchterm = params[:searchterm].downcase
    category = Funko.where('category = ?', "#{searchterm}")
    render json: category.to_json(
      :except => [:created_at, :updated_at]
    )
  end

end