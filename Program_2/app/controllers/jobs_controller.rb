class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs_list
  # GET /jobs_list.json
  def index
    @jobs = Job.all
  end

  # GET /jobs_list/1
  # GET /jobs_list/1.json
  def show
  end

  # GET /jobs_list/new
  def new
    @job = Job.new
    @current_user = User.find_by_id(session[:user_id])


  end

  # GET /jobs_list/1/edit
  def edit
    @current_user = User.find_by_id(session[:user_id])
  end

  # POST /jobs_list
  # POST /jobs_list.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs_list/1
  # PATCH/PUT /jobs_list/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs_list/1
  # DELETE /jobs_list/1.json
  def destroy
    @applications=JobApplication.find_by_job_id(@job.id)
    @ids=@applications.user_id
    @users=User.where(id: @ids)
    #byebug
    respond_to do |format|
    if @job.destroy
      for user in @users
        mail=UserMailer.welcome_email(user)
        mail.deliver_now
      end
    format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.'  }
    format.json { head :no_content }
    else
      format.html { render action: 'new' }
      format.json { render json: @users.errors, status: :unprocessable_entity }
    end
    #@job.destroy
     # UserMailer.welcome_email(@user).deliver_later
    #respond_to do |format|
     # format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      #format.json { head :no_content }
    #end
  end
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:description, :employment, :responsibilities, :requirements, :company_id, :user_id)
    end
  end