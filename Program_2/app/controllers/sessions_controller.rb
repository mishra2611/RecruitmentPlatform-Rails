class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
    session[:user_id]=nil
    session[:usertype]=nil
  end

  def create
    user=User.find_by(email:params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id]=user.id
      session[:usertype] = params[:usertype]
      session[:email] = user.email
      if params[:usertype] == '0'
        if user.email == "admin517@gmail.com" then
          redirect_to system_admin_url
        else
          session[:user_id] = nil
          session[:usertype] = nil
          session[:email] = nil
          redirect_to login_url, alert:"Access Denied"
        end
      elsif params[:usertype] == '1'
        redirect_to job_seeker_home_url
      elsif params[:usertype] == '2'
        redirect_to recruiter_url
      end
    elsif user.nil?
      redirect_to new_user_url, alert:"Sign up if you are a new user"
    else
      redirect_to login_url,alert:"Invalid username or Password"
    end
  end

  def destroy
    session[:user_id]=nil
    session[:usertype]=nil
    session[:email]=nil
    redirect_to login_url, alert:"You have successfully logged out"
  end

  def createLogin
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    session[:usertype] = '2'
    session[:email] = user.email
    redirect_to recruiter_url
  end
end
