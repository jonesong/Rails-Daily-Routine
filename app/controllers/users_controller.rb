class UsersController < ApplicationController

  layout 'public'

  before_action :confirm_logged_in
  before_action :load_sessions
  before_action :setup_navigation
  before_action :attempt_users

  def index
    @users = User.all.sorted
  end

  def new
  end

  def create
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def delete
  end

  def detroy
  end

  private

  def attempt_users
    attempt_module("User")
  end
end
