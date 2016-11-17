class UserMailer < ApplicationMailer
  default from: "tien.framgia@gmail.com"

  def sample_email(order)
    @order = order
    mail(to: "tien.framgia@gmail.com", subject: 'Confirm Request From F&D Framgia ')
  end

  def transaction_request_mail(order)
    @order = order
    mail(to: "tien.framgia@gmail.com", subject: 'Transaction Request')
  end

  def confirm_mail(order)
    @order = order
    mail(to: "tien.framgia@gmail.com", subject: 'Accept Order')
  end
end
