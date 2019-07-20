class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: users.to_json(
      :except => [:password, :updated_at, :created_at],
      :include => {
        :collections => {
          :only => [:id, :available_to_trade],
          :include => {:funko => {
            :except => [:item_number, :updated_at, :created_at]
          }}
        }, 
        :wishlists => {
          :only => [:id],
          :include => {:funko => {
            :except => [:item_number, :updated_at, :created_at]
          }}
        } 
      }
    )
  end

  def new
    user = User.new
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      payload = {user_id: user.id}
      token = issue_token(payload)
      render json: { jwt: token }
    else
      render json: { error: user.errors.full_messages}
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email, :city, :country, :pic_url)
  end

end