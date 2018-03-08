class UserMailer < ApplicationMailer
  default from: "smishra4@ncsu.edu"

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Application status')
  end
end
