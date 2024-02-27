class BugsController < ApplicationController
  load_and_authorize_resource
   before_action :set_project, except: [:edit, :update,:index, :assign]
    before_action :set_bug, only: [:show, :destroy]
  
    
    def index
      if current_user.developer?
        @projects = current_user.projects
        @bugs = Bug.where(project_id: @projects.pluck(:id))
      else 
        # @bugs=Bug.all
        @q = Bug.ransack(params[:q])
        @bugs = @q.result
      end
    end


    def new 
    end 
    
    def create
      @project = Project.find(params[:project_id])
      @bug = @project.bugs.new(bug_params)
      @bug.created_by = current_user.name if current_user
       if @bug.save
        if @bug.user.present?
           @user=@bug.user
         MyThirdJob.perform_in(5.seconds,@user.id, @bug.id)
        redirect_to project_path(@project), notice: 'Bug was successfully created.'
        else
          redirect_to project_path(@project), notice: 'Bug was successfully created.'
        end
      else
        redirect_to project_path(@project), alert: 'Failed to create bug.'
      end
    end
    
  
    
    def show
    end
  

    def edit
      @project = Project.find(params[:project_id])
      @bug = @project.bugs.find(params[:id])
      
    end
  
    
    def update
      @project = Project.find(params[:project_id])
      @bug = @project.bugs.find(params[:id])
    
      if @bug.update(bug_params)
        puts "Bug status updated successfully: #{@bug}"
        redirect_to project_path(@project), notice: 'Bug was successfully updated.'
      else
        puts "Failed to update bug status: #{@bug.errors.full_messages}"
        render :edit
      end
    end
    
    def assign
      @bug = Bug.find(params[:id])
      @bug.update(user_id: current_user.id)
      redirect_to bugs_path, notice: 'Bug was successfully assigned to yourself.'
    end
    

    def destroy
      @bug.destroy
      redirect_to project_bugs_path(@project), notice: 'Bug was successfully destroyed.'
    end
  
    private
  
      def set_project
        @project = Project.find(params[:project_id])
      end
  
      def set_bug
        @bug = @project.bugs.find(params[:id])
      end
  

        private

        def bug_params
          params.require(:bug).permit(:title, :category, :status, :deadline, :user_id, :project_id)
        end
        
      
  end
  