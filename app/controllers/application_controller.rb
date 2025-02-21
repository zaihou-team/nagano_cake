class ApplicationController < ActionController::Base
    helper_method :current_customer
    
    
  protected

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path 
    when Customer
      root_path 
    else
      root_path
    end
  end

end
