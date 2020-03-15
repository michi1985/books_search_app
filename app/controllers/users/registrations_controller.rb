class Users::RegistrationsController < Devise::RegistrationsController

  def new
    super
  end

  def create
    user = User.new(sign_up_params)
    if user.save
      redirect_to new_user_session_path(user.id)
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
