class RecruiterController < ApplicationController
  def new
    current_user = User.find_by_id(session[:user_id])
    @recruiters=User.find(current_user.id)
    session[:usertype] = '2'

  end

  def view
    current_user = User.find_by_id(session[:user_id])
    puts(current_user)
    @recruiters=User.find(current_user.id)
  end

  def create_job
  end

  def edit
    current_user = User.find_by_id(session[:user_id])
    @recruiters=User.find(current_user.id)

  end

  def update
    respond_to do |format|
      flash[:notice] =  'Recruiter was successfully created.'
      if @recruiters.save(user_params)
        format.html { redirect_to recruiter_view_path, notice: 'recruiter details was successfully updated.' }
        format.json { render :show, status: :ok, location: @recruiters }
      else
        format.html { render :edit }
        format.json { render json: @recruiters.errors, status: :unprocessable_entity }
      end
    end

  end
  def view_jobs
    @jobs=Job.all
    @current_user = User.find_by_id(session[:user_id])
  end

end
