class Auth::RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(resource)
    root_path
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)#:first_name, :last_name,
  end
end