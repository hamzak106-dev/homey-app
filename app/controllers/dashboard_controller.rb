class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.includes(:comments) # Fetch projects with comments
  end
end