class CommentsController < ApplicationController
  def create
    @gallery = Gallery.find(params[:gallery_id])
    @comment = Comment.new(comment_params) do |c|
      c.gallery = @gallery
      c.user_ip = request.remote_ip
      c.user_agent = request.user_agent
      c.referrer = request.referer
    end

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
