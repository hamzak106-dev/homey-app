class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.includes(:comments)
  end

  def show
    @project = Project.find(params[:id])
    @comments = @project.comments.includes(:user).order(created_at: :desc)
  end
  

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to @project, notice: "Project created successfully."
    else
      render :new
    end
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @project.update(project_params)
      redirect_to @project, notice: "Project updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
    redirect_to projects_path, notice: "Project deleted."
  end

  private

  def project_params
    params.require(:project).permit(:name, :status)
  end
end