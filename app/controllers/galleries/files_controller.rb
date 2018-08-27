class Galleries::FilesController < Admin::ApplicationController 
  before_action :set_gallery, :set_file

  def destroy
    @file.purge_later
    redirect_to admin_gallery_path(@gallery)
  end

  private

  def set_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end

  def set_file
    @file = @gallery.files.find(params[:id])
  end
end