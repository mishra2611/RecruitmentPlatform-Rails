class ViewApplicantsController < ApplicationController
  def view
    @job=Job.find_by_id(params[:job_id])
    @applicants=JobApplication.where(job_id:@job.id)

  end


end
