# coding: utf-8
class ApiController < ActionController::Base
  respond_to :json

  def render_json(status, message)
    render status: status, json: message
  end

  def auth_token
    @user = User.find_by(token: params[:token])
    if @user.blank?
      render_json 403, {error: "未授权操作"}
      return
    end
  end

end