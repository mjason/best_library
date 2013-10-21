class Book < ActiveRecord::Base
  
  before_create :init_book
  
  belongs_to :user

  def init_book
    resp = Douban.get_isbn self.isbn
    body = JSON.parse resp.body
    self.name = body["title"]
  end
end
