class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_commentable

    def create
        @comment = @commentable.comments.new comment_params
        @comment.user = current_user
        @comment.save
            redirect_to @commentable, notice: "Yorumunuz Gönderildi."
    end

    private

        def comment_params
            params.require(:comment).permit(:body)
        end


         def find_commentable
      @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
      @commentable = Image.find_by_id(params[:image_id]) if params[:image_id]
    end
end