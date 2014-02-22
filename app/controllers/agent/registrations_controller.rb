class Agent::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  def new
    resource = build_resource({})
    resource.build_agent_detail
    respond_with resource
  end

  protected  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u| 
      u.permit :email, :password, :password_confirmation, 
        :agent_detail_attributes => [:name, :address_1, :town, :postcode, :email, :main_phone]  
    end
  end

end 
