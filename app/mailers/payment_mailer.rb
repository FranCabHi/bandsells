class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.received_payment.subject
  #
  def received_payment(user, payment)
    @user = user
    @payment = payment
    mail(
      to: user.email,
      subject: 'Thank you for your purchase!'
    )
  end
end
