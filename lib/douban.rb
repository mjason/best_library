class Douban
  include HTTParty

  base_uri 'https://api.douban.com/v2/book'

  def self.get_isbn(isbn)
    Douban.get("/isbn/#{isbn}")
  end
end