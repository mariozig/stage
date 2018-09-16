class ReportsController < ApplicationController
  def create
    @gallery = Gallery.find(params[:gallery_id])
    @report = Report.new(report_params) do |r|
      r.gallery = @gallery
    end

    if @report.save
      redirect_to(@gallery, notice: 'Report was successfully created.')
    else
      render 'galleries/show'
    end
  end

  private

  def report_params
    params.require(:report).permit(:content, :email, :name, :gallery_id, :report_reason_id)
  end
end
