class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = t(:please_log_in)
      redirect_to(access_login_path)
      # redirect_to prevents requested action from running
    end
  end

  def setup_navigation
    current_user = User.find(session[:user_id])
    @programUsers = current_user.programs
  end

  def load_sessions
    @userid = session[:user_id]
    @username = session[:username]
  end

  def attempt_module(name)
    found = nil
    @programUsers.each do |programUser|
      if programUser.name == name
        found = programUser.name.inspect
      end
    end

    if found.nil?
      # logger.debug("*** You dont' have access ***")
      redirect_to('/404')
    end
  end

  # def page_not_found
  #   respond_to do |format|
  #     format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 }
  #     format.all  { render nothing: true, status: 404 }
  #   end
  # end

end
