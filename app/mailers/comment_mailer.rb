class CommentMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def comment_email(postUser,comment,commentUser)
    @postUser = postUser
    @comment = comment
    @commentUser = commentUser
    @url  = 'http://localhost:3000'
    mail(to: @postUser.email, subject: @commentUser.name + ' Commented on your post!')
  end
end
