class PagesController < ApplicationController
  def home
    if !user_signed_in?
      timestamp = Time.now.strftime("%Y%m%d%H%M%S")

      User.create(name: "dummy" + timestamp, email: "dummy" + timestamp + "@email.com", password: "foobar1", password_confirmation: "foobar1")
    end

    session['timestamp'] = timestamp

    @rakuten_items = RakutenWebService::Books::Book.search(page: 1)

    # michi11@email.com foobarfoo
    # @rakuten_items = RakutenWebService::Books::Book.search(page: 1)
    #@rakuten_items = []
    #100.times { |n|
    #@rakuten_items.push(RakutenWebService::Books::Book.search(page: n+1))
    #}
    #著者名、内容コメントが楽天APIで空だった場合に
    #AmazonAPIの情報を入れる
    #@rakuten_items.each do |rakuten_item|
    #  @amazon_item =
    #  if rakuten_item["author"] == ""
    #  end
    #  if rakuten_item["itemCaption"] == ""
    #  end
    #end

  end

  def home_book_list
    @item = RakutenWebService::Books::Book.search(page: params[:page])
    render json: @item
  end

  def login
  end

  def signup
  end

  def mypage
  end
end
