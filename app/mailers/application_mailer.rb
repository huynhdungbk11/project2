class ApplicationMailer < ActionMailer::Base
  default from: "tien.framgia@gmail.com"

  def order_email course
    @supervisor = course

    mail to: "tien.framgia@gmail.com", subject: 'Sample Email'
  end
end
