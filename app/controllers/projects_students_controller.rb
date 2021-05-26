class ProjectsStudentsController < ApplicationController
    def create
        if current_user.type == 'Student'
            @project = Project.find(params[:project_id])
            current_user.projects << @project
        else 
            redirect_to project_path, notice: 'ERROR: You are not a student.'
        end
    end
end
