class CommentsController < ApplicationController
    before_action :authenticate_user!
    def create
        @project = Project.find(params[:project_id])
        @comment = @project.comments.create(comment_params)
        @comment.user = current_user
        @comment.save
        redirect_to project_path(@project)
    end
    private
    def comment_params
        params.require(:comment).permit(:user_id, :body)
    end
end
