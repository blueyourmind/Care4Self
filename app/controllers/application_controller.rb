# class ApplicationController < ActionController::Base
#   before_action :authenticate_user!
#   def after_sign_in_path_for(resource)
#     medications_path
#   end

# end

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    medications_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :family_phone_number])
  end
end
