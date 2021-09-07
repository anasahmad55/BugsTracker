class UserMailer < ApplicationMailer
  def created_bug
    @user = params[:user]
    mail(to: @user.email, subject: 'Bug Crested')
  end
end
