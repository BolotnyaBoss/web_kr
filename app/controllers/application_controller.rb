class ApplicationController < ActionController::Base
  include Pundit

  def pundit_user
    current_model
  end

  rescue_from Pundit::NotAuthorizedError, with: :model_not_authorized

  private
  def model_not_authorized
    flash[:alert] = "You aren`t authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

end
