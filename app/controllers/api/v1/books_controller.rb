# coding: utf-8
class Api::V1::BooksController < ApiController
  before_action :auth_token

  def create
    @book = Book.find_or_create_by(isbn: params[:isbn])
    @book.user = @user
    @book.save
    render_json 200, {message: "操作成功"}
  end

end
