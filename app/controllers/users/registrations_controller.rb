class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    dummy_timestamp = session['timestamp']
    dummy_user_name = "dummy" + dummy_timestamp
    dummy_user_email = "dummy" + dummy_timestamp + "@email.com",

    dummy_user = User.find_by(name: dummy_user_name)

    if dummy_user.update(name: params[:name], email: params[:email], password: params[:password])
      redirect_to root_path
    else
      redirect_to sign_up_path
    end

  end

end
