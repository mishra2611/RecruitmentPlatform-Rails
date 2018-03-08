class JobSeekerController < ApplicationController
  def home
    @job_applications = JobApplication.where(['user_id = ?',session[:user_id]])
    session[:usertype] = '1'
    render('home')
  end

  def edit
    @job_seeker = User.find_by_id(session[:user_id])
    render('edit')
  end

  def jobs_list
    @jobs = Job.all
    @companies = Company.all
    render('jobs_list')
  end

  def jobs_filtered_list
    @jobs = Job.all
    @companies = Company.all
    if params[:company] != ''
      @jobs = @jobs.where(['company_id = ?',params[:company]])
    end
    if params[:employment] != ''
      @jobs = @jobs.where(['employment = ?',params[:employment]])
    end
    if params[:industry] != ''
      @jobs = @jobs.where(company_id: @companies.where(['industry = ?',params[:industry]]))
    end
    if params[:size] != ''
      @jobs = @jobs.where(company_id: @companies.where(['size = ?',params[:size]]))
    end
    if params[:hq] != ''
      @jobs = @jobs.where(company_id: @companies.where(['hq = ?',params[:hq]]))
    end
    render('jobs_list')
  end

end
