# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def created_bug
    UserMailer.with(user: User.last).created_bug
  end
end
