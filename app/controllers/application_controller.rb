# ApplicationController with Pundit and Unauthorized Rescue
class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def user_not_authorized
    respond_to do |format|
      format.html do
        flash[:error] = 'You are not authorized to perform this action'
        redirect_to request.headers['Referer'] || root_path
      end
      format.json { head 403 }
    end
  end
end
