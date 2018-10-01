# file: lib/tasks/email_tasks.rake
# before_filter :authenticate_user!

desc 'send_user_report'
task send_user_report: :environment do
  user = User.find(14)
  #user.email = 'tpiaggio7@gmail.com'
  UserMailer.user_report(user).deliver!
end