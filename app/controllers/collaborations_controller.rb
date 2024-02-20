# app/controllers/collaborations_controller.rb
class CollaborationsController < ApplicationController
  load_and_authorize_resource
    def create
      @project = Project.find(params[:project_id])
      user_id = collaboration_params[:user_id]
  
      # Check if the user is already assigned to the project
      if @project.collaborations.exists?(user_id: user_id)
        redirect_to @project, alert: 'User is already assigned to the project.'
        return
      end
  
      @collaboration = @project.collaborations.new(collaboration_params)
      if @collaboration.save

          @user=@collaboration.user
          @project=@collaboration.project
        MyFirstJob.perform_in(5.seconds,@user.id, @project.id)
        redirect_to @project, notice: 'User was successfully added to the project.'
       
      else
        redirect_to @project, alert: 'Failed to add user to the project.'
      end
    end
  
    def destroy
        @project = Project.find(params[:project_id])
        @user = User.find(params[:user_id])
        @collaboration = @project.collaborations.find_by(user_id: @user.id, id: params[:id])
        
        if @collaboration.destroy
          redirect_to @project, notice: 'Collaboration was successfully destroyed.'
        else
          redirect_to @project, alert: 'Failed to destroy collaboration.'
        end
      end
  
    private
  
    def collaboration_params
      params.require(:collaboration).permit(:user_id)
    end
  end
  