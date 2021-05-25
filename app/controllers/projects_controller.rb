class ProjectsController < ApplicationController
    def index
        @projects = Project.all
    end

    def show
        @project = Project.find(params[:id])
    end

    def new
        if current_user.type == 'Mentor'
            @project = Project.new
        else
            redirect_to index_path, notice: "ERROR: STUDENT'S CANNOT CREATE PROJECTS."
        end
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
        if @project.user == current_user
            @project = Project.find(params[:id])
        else
            redirect_to project_path, notice: "PERMISSION DENIED!"
        end
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
        if current_user == @project.user
            @project.destroy
            redirect_to index_path
        else
            redirect_to project_path, notice: "PERMISSION DENIED!!!"
        end
    end

    private
    def project_params
        params.require(:project).permit(:project_name, :project_description, :start_date, :end_date, :project_id)
    end
end
