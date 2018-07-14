class RegistrationsController < Devise::RegistrationsController

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