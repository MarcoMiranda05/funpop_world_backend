class FunkosController < ApplicationController

  def index
    funkos = Funko.all
    shuffle_funkos = funkos.shuffle
    render json: render_format(shuffle_funkos)
  end

  def show
    funko = Funko.find(params[:id])
    render json: render_format(funko)
  end

  def search
    searchterm = params[:searchterm].downcase
    results = Funko.where('name ILIKE ?', "%#{searchterm}%").or(Funko.where('fandom ILIKE ?', "%#{searchterm}%"))
    render json: render_format(results)
  end

  def category
    searchterm = params[:searchterm]
    category = Funko.where('category = ?', "#{searchterm}")
    render json: render_format(category)
  end

  private

  def render_format(x)
    x.to_json(
      :except => [:created_at, :updated_at]
    )
  end
end