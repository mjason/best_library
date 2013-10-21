# coding: utf-8
class Api::V1::UsersController < ApiController
  
  before_action :auth_token, only: [:show]

  def create
    user_info = params.permit(:email, :password)
    @user = User.find_by(email: user_info[:email])
    if @user.blank?
      return render_json 401, {error: "用户密码错误"}      
    elsif not @user.valid_password? user_info[:password]
      return render_json 401, {error: "用户密码错误"}
    end
    @user.reset_token
    @user.reload
  end

  def delete
  end


  def show
    render_json 200, {message: "已登录"}
  end

end
