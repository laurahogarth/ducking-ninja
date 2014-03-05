class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  ###################
  # AUTHENTICATION
  ###################
  def after_sign_in_path_for(user)
    if user.is_a? Traveller
      return holidays_url
    elsif user.is_a? Agent
      return agent_root_url
    else
      super
    end
  end


  ###################
  # AUTHORIZATION
  ###################
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def current_user
    return current_agent if agent_signed_in? 
    return current_traveller if traveller_signed_in?
    nil
  end



end
