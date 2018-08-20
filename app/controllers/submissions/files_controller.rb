class Submissions::FilesController < Admin::ApplicationController 
  before_action :set_submission, :set_file

  def destroy
    @file.purge_later
    redirect_to admin_submission_path(@submission)
  end

  private

  def set_submission
    @submission = Submission.find(params[:submission_id])
  end

  def set_file
    @file = @submission.files.find(params[:id])
  end
end