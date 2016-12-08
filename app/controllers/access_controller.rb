class AccessController < ApplicationController

  layout 'public'

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  before_action :load_sessions, :only => :menu
  before_action :setup_navigation, :only => :menu

  def menu
    # display text & links
  end

  def login
    # login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      flash[:notice] = t(:logged_in)
      redirect_to(admin_path)
    else
      flash.now[:notice] = t(:invalid_log)
      render('login')
    end

  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    flash[:notice] = t(:logged_out)
    redirect_to(access_login_path)
  end

end
