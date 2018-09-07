class CommentsController < ApplicationController
  def create
    @gallery = Gallery.find(params[:gallery_id])
    @comment = Comment.new(comment_params)
    @comment.gallery = @gallery

    if @comment.save
      redirect_to(@gallery, notice: 'Comment was successfully created.')
    else
      render 'galleries/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :email, :name, :gallery_id)
  end
end
