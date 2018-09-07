class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show]

  def index
    @galleries = Gallery.all
  end

  def show
    @comment = Comment.new(gallery: @gallery)
  end

  private

  def set_gallery
    @gallery = Gallery.friendly.find(params[:id])
  end
end
