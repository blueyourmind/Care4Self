class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def after_sign_in_path_for(resource)
    medications_path
  end

end

   def default_url_options
     { host: ENV["DOMAIN"] || "localhost:3000" }
  end
