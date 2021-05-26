class ProjectsStudentsController < ApplicationController
    def create
        if current_user.type == 'Student'
            @project = Project.find(params[:project_id])
                current_user.projects << @project
                render :template => 'projects/show'
        else 
            redirect_back fallback_location: { action: "show" }, notice: "ERROR, mentor accounts cannot enrol in projects!"
        end
    end
end
