class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email(user,post)
    @user = user
    @post = post
    @url  = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
