class ProjectsController < ApplicationController

  layout 'public'

  before_action :confirm_logged_in
  before_action :load_sessions
  before_action :setup_navigation
  before_action :attempt_projects
  before_action :set_project_variables, :only => [:show, :edit, :update]

  def index
    @projects = Project.list(@userid).sorted_by_name.newest_first.limit(10)
  end

  def show
  end

  def new
    @project = Project.new()
  end

  def create
    # Instantiate a new object using form parameters
    @project = Project.new(project_params)
    @project.user_id = @userid
    # Save the object
    if @project.save
      # If save succeeds, redirect to the index action
      flash[:notice] = t(:project_created, as: @project.name)
      redirect_to(projects_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
  end

  def update
    # Update the object
    if @project.update_attributes(project_params)
      # If save succeeds, redirect to the show action
      flash[:notice] = t(:project_updated, as: @project.name)
      redirect_to(projects_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render ('edit')
      # render :edit, :locals => {:id => @project.id}
    end
  end

  def delete
  end

  def destory
  end

  private

  def project_params
    params.require(:project).permit(:name, :note)
  end

  def set_project_variables
    @project = Project.find(params[:id])
    @tasks = Task.list(params[:id])
  end

  def attempt_projects
    attempt_module("Project")
  end

end
