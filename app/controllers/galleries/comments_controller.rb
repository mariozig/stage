class Galleries::CommentsController < ApplicationController
  def create
    @gallery = Gallery.find(params[:gallery_id])
    @comment = @gallery.comments.build(comment_params)

    if @comment.save
      redirect_to(@gallery, notice: 'Comment was successfully created.')
    else
      render @gallery
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:name)
    end
end
