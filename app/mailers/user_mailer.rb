class UserMailer < ApplicationMailer
  def created_bug
    @user = params[:user]
    mail(to: @user.email, subject: 'Bug Crested')
  end

  def created_user
    @user = params[:user]
    mail(to: @user.email, subject: 'User Crested')
  end

  def created_project
    @user = params[:user]
    mail(to: @user.email, subject: 'Project Crested')
  end
end
