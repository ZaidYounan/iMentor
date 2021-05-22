class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        @project.user = current_user

        if @project.save
            redirect_to @project
        else
            render :new
        end
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        if @project.update(project_params)
            redirect_to @project
        else
            render :show
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        
        redirect_to index_path
    end

    private
    def project_params
        params.require(:project).permit(:project_name, :project_description, :start_date, :end_date)
    end
end
