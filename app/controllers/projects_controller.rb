class ProjectsController < ApplicationController
  load_and_authorize_resource

    def index
      if current_user.developer?
        @projects = current_user.projects
      else
        @projects = Project.all
      end
    end
  
    def show
      @project = Project.find(params[:id])
      @collaborations = @project.collaborations.includes(:user)
  
    end
  
    def new
      @project = Project.new
      @project.collaborations.build 
    end
  
    def create
      @project = Project.new(project_params)
      @project.creator_id = current_user.id
      if @project.save
        @users = @project.users
        @users.each do |user|
          MyFirstJob.perform_in(5.seconds, user.id, @project.id)
        end
        redirect_to projects_path notice: 'Project was successfully created.'
      else
        render :new
      end
    end
    
  
    def edit
      @project = Project.find(params[:id])
      @collaborations = Collaboration.where(project_id: @project.id)
    end
    
  
    def update
        @project = Project.find(params[:id])
      if @project.update(project_params)
        @users = @project.users
        @users.each do |user|
    
          MySecondJob.perform_in(5.seconds, user.id, @project.id)
        end
        redirect_to @project, notice: 'Project was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
        @project = Project.find(params[:id])
      @project.destroy
      redirect_to projects_path, notice: 'Project was successfully destroyed.'
    end
  
    private
      def project_params
        # params.require(:project).permit(:name, :description)
        params.require(:project).permit(:name, :description, collaborations_attributes: [:id, :user_id,:project_id, :_desrtroy])
        
      end
  end
  