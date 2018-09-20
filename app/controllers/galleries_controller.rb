class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show]

  def index
    @pagy, @galleries = pagy(Gallery.all, items: 40)
  end

  def show
    @comment = Comment.new(gallery: @gallery)
    @report = Report.new(gallery: @gallery)
  end

  private

  def set_gallery
    @gallery = Gallery.friendly.find(params[:id])
  end
end
