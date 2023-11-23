class ApplicationController < ActionController::Base
  # [...]
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :family_phone_number])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number, :family_phone_number])
  end
end
