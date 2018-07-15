class PagesController < ApplicationController
  def home
    if !user_signed_in?
      timestamp = Time.now.strftime("%Y%m%d%H%M%S")

      User.create(name: "dummy" + timestamp, email: "dummy" + timestamp + "@email.com", password: "foobar1", password_confirmation: "foobar1")
    end

    session['timestamp'] = timestamp
  end

  def login
  end

  def signup
  end

  def mypage
  end
end
