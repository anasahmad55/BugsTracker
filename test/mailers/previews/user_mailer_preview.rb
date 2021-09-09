# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def created_bug
    UserMailer.with(user: User.last).created_bug
  end

  def created_user
    UserMailer.with(user: User.last).created_user
  end

  def created_project
    UserMailer.with(user: User.last).created_project
  end

end
