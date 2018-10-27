class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    dummy_timestamp = session['timestamp']
    dummy_user_name = "dummy" + dummy_timestamp
    dummy_user_email = "dummy" + dummy_timestamp + "@email.com",

    dummy_user = User.find_by(name: dummy_user_name)

    if dummy_user.update(sign_up_params)
      redirect_to new_user_session_path(dummy_user.id)
    else
      render new_user_registration_path
    end

  end

  def after_sign_up_path_for(resource)
    user_path(resource)
  end

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  private

    def sign_up_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
