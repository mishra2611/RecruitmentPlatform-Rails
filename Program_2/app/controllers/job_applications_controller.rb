class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: [:show, :edit, :update, :destroy]

  # GET /job_applications
  # GET /job_applications.json
  def index
    @job_applications = JobApplication.all
  end

  # GET /job_applications/1
  # GET /job_applications/1.json
  def show
  end

  # GET /job_applications/new
  def new
    @job_application = JobApplication.new
  end

  # GET /job_applications/1/edit
  def edit
  end

  # POST /job_applications
  # POST /job_applications.json
  def create
    @job_application = JobApplication.new(job_application_params)
    respond_to do |format|
      if @job_application.save
        format.html { redirect_to job_seeker_home_url, notice: 'Successfully applied to job.' }
      else
        format.html { redirect_to new_job_application_path(:job_id => @job_application.job.id), notice: @job_application.errors }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /job_applications/1
  # PATCH/PUT /job_applications/1.json
  def update
    respond_to do |format|
      if @job_application.update(job_application_params)
        if session[:usertype]=='2'
          format.html { redirect_to view_applicants_view_url(:job_id=> @job_application.job.id), notice: 'Job application was successfully updated.' }
          format.json { render :show, status: :ok, location: @job_application }
        end
        format.html { redirect_to @job_application, notice: 'Job application was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_application }
      else
        format.html { render :edit }
        format.json { render json: @job_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_applications/1
  # DELETE /job_applications/1.json
  def destroy
    @job_application.destroy
    respond_to do |format|
      format.html { redirect_to job_seeker_home_url, notice: 'Job application was successfully withdrawn.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_application_params
      params.require(:job_application).permit(:linkedin, :portfolio, :additionalinfo, :gender, :race, :veteran, :disability)
    end

    private def job_application_params
      params.require(:job_application).permit!
    end

end
