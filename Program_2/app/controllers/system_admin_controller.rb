class SystemAdminController < ApplicationController
  def index
    session[:usertype] = '0'
  end
end
