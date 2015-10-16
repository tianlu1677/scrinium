class RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource resource, params
    resource.update_without_password sign_up_params
  end

  def after_update_path_for resource
    session[:previous_url] ? session[:previous_url].last : root_path
  end

  private

  def sign_up_params
    params.require(:user).permit(:avatar,
                                 :name,
                                 :gender,
                                 :organization_id,
                                 :position,
                                 :email,
                                 :role,
                                 :status,
                                 :password,
                                 :password_confirmation)
  end
end
