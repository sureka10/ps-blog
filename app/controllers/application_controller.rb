class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  include CanCan::ControllerAdditions
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "You must be the owner of this resource to modify it!"
    flash.keep(:alert)
    redirect_to posts_path
  end
end
