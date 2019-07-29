class OffersController < ApplicationController

  def index
    offers = Offer.all
    render json: render_format(offers)
  end

  def show
    offer = Offer.find(params[:id])
    render json: render_format(offer) 
  end

  def create
    offer = Offer.new(offer_params)
    if offer.valid?
      offer.save
      render json: render_format(offer)
    else
      render json: {error: "Sorry was not possible add this Funko to your collection."}
    end
  end

  def update
    offer = Offer.find(params[:id])
    offer.update(offer_params)
    render json: render_format(offer)
  end

  def destroy
    offers = Offer.all
    offer = Offer.find(params[:id])
    offer.destroy
    render json: render_format(offers)
  end

  def my_offers
    user_id = params[:user_id]
    query =  <<-SQL
    SELECT offers.id
    FROM offers
    JOIN collections
    ON collections.id = offers.incoming_funko_id
    JOIN users
    ON users.id = collections.user_id
    WHERE users.id = #{user_id}
    UNION
    SELECT offers.id
    FROM offers
    JOIN collections
    ON collections.id = offers.outcoming_funko_id
    JOIN users
    ON users.id = collections.user_id
    WHERE users.id = #{user_id};
    SQL
    offers = ActiveRecord::Base.connection.exec_query(query).to_hash.map{ |hash_obj| Offer.find(hash_obj["id"])}
    render json: render_format(offers)
  end

  private

  def offer_params
    params.require(:offer).permit(:incoming_funko_id, :outcoming_funko_id, :status)
  end

  def render_format(x)
    x.to_json(
      :only => [:id, :status],
      :include => {
        :incoming_funko => {
          :only => [:id],
          :include => {
            :funko => {
              :except => [:updated_at, :created_at],
            },
            :user => {
              :except => [:updated_at, :created_at, :password_digest],
            }
          }
        },
        :outcoming_funko => {
          :only => [:id],
          :include => {
            :funko => {
              :except => [:updated_at, :created_at],
            },
            :user => {
              :except => [:updated_at, :created_at, :password_digest],
            }
          }
        }
      })
  end

  
end
