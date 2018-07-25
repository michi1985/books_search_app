class PagesController < ApplicationController
  def home
    if !user_signed_in?
      timestamp = Time.now.strftime("%Y%m%d%H%M%S")

      User.create(name: "dummy" + timestamp, email: "dummy" + timestamp + "@email.com", password: "foobar1", password_confirmation: "foobar1")
    end

    session['timestamp'] = timestamp

    @items = RakutenWebService::Books::Book.search(page: 1)
    # images_arr = []
    # items.each do |item|
    #
    # # したい処理
    # puts item['itemName'] #商品名
    # puts item['itemPrice'] #価格
    # puts item['itemUrl'] #商品のURL
  end

  def home_book_list
    @items = RakutenWebService::Books::Book.search(page: 2)
    render json: @items
  end

  def login
  end

  def signup
  end

  def mypage
  end
end
