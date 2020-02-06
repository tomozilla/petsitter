class ApplicationController < ActionController::Base
  # You must signed in.
  before_action :authenticate!
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  :pundit_user
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :location])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :location])
  end
  private
  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def authenticate!
    if owner_signed_in?
      authenticate_owner!
    elsif sitter_signed_in?
      authenticate_sitter!
    else
      authenticate_owner!
    end
  end

  def pundit_user
    current_owner || current_sitter
  end
  
end
