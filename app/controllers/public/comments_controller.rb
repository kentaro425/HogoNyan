class Public::CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    @post = Post.find(params[:post_id])
    @comment.post_id = @post.id
    # @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(@post), notice: 'コメントを投稿しました'
    else
      render 'posts/show'
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end

end
