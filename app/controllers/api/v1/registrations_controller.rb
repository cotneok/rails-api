class Api::V1::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_params_exist, only: :create

  #Sign Up
  def create
    user = User.new(user_params)
    if user.save
      render json: {
        message: "Signed Up Successfully",
        is_success: true,
        data: {
          user: user
        }
      }, status: :ok
    else
      render json: {
        message: "Something Wrong",
        is_success: false,
        data: {}
      }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_cnofirmation)
  end

  def ensure_params_exist
    require if params[:user].present?
    render json: {
      message: "Missing Params",
      is_success: false,
      data: {}
    }, status: :bad_request
  end
end
