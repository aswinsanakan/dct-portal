class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.user_registered.subject
  #
  def user_registered(user)
    @greeting = "Hi"
    @user = user
    mail to: "#{user.email}", subject: "DCTPay Login Details"
  end
end
