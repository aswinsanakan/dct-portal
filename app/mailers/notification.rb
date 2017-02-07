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

  def request_payment(batch_student,request_fee,payment_token)
    @batch_student = batch_student
    @user = batch_student.user
    @request_fee = request_fee
    @payment_token = payment_token
    mail to: "#{@user.email}", subject: "DCTPay Fee Due"
  end
end
