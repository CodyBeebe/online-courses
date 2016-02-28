class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.all
  end

  def new
    @submission = Submission.new
  end

  def create
  	@submission = Submission.first
  	if @submission
    	@submission.destroy
    end
    @submission = Submission.new(submission_params)

    if @submission.save
      redirect_to submissions_path
    else
      render "new"
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to submissions_path
  end

private
  def submission_params
    params.require(:submission).permit(:name, :attachment)
  end
end
