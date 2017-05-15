class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
    @user = User.create
  end
  # POST /resource
  def create
    @user = User.new(sign_up_params)

      if @user.save
        sign_up(resource_name, resource)
        redirect_to get_started_avatar_path
      end
  end


  # PUT /resource
  def update
    resource.update_attributes account_update_avatar
    redirect_to root_path
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end
  private
    def sign_up_params
      params.require(:user).permit(:user_name, :address, :email, :password,
        :password_confirmation, :avatar)
    end
    def account_update_params
      params.require(:user).permit(:user_name, :address, :email, :password,
        :password_confirmation, :current_password, :avatar)
    end
    def account_update_avatar
      params.require(:user).permit(:avatar) if params[:user]
    end
  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
