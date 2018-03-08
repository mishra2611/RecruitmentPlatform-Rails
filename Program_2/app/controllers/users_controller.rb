class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authorize, only: [:new,:create,:index]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user=User.find_by(session[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        if session[:usertype] == '0'
          format.html { redirect_to system_admin_path, notice: 'User was successfully created.' }
        else
        format.html { redirect_to root_url, notice: 'User was successfully created. Log in to access the system' }
        format.json { render :show, status: :created, location: @user }
        end
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

    respond_to do |format|

      if session[:usertype=='2'] then
        #flash[:alert] =  'Article was successfully created.'
        @current_user=User.find_by_id(session[:user_id])

      end

      if @user.update(user_params) then
        if session[:usertype] == '0' then
          format.html {redirect_to system_admin_path, notice: 'Profile updated successfully'}
          format.json {render :show, status: :ok, location: @user}
        elsif session[:usertype] == '1' then
          format.html {redirect_to job_seeker_home_path, notice: 'Profile updated successfully'}
          format.json {render :show, status: :ok, location: @user}
        elsif session[:usertype] == '2' then
          format.html {redirect_to recruiter_path, notice: 'Profile updated successfully'}
          format.json {render :show, status: :ok, location: @user}
        end
        #format.html { redirect_to users_url, notice: 'User details were successfully updated.' }
        #format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:company_id,:phone,:last_name,:middle_name)
  end
end
