class Api::V1::UsersController < ApplicationController
  def index
    users = []
    User.all.each do |user|
      user_hash = {
        username: user[:username],
        id: user[:id],
        email: user[:email],
        city: user[:city],
        country: user[:country],
        pic_url: user[:pic_url]
      }
      users << user_hash
    end
    render json: users
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