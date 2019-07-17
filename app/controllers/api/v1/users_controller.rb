class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users.to_json(
      :except => [:password, :updated_at, :created_at],
      :include => {
        :collections => {
          :only => [:id, :funko_id, :available_to_trade],
          :include => {:funko => {
            :except => [:id, :item_number, :updated_at, :created_at]
          }}
        }, 
        :wishlists => {
          :only => [:id, :funko_id, :available_to_trade],
          :include => {:funko => {
            :except => [:id, :item_number, :updated_at, :created_at]
          }}
        } 
      }
    )
  end

  def create
    user = User.new(user_params)
    if user.save
      payload = {user_id: user.id}
      token = issue_token(payload)
      render json: { jwt: token }
    else
      render json: { error: "Signup not successful !"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :city, :country, :pic_url)
  end

end