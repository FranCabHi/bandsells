# Preview all emails at http://localhost:3000/rails/mailers/payment_mailer
class PaymentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_mailer/received_payment
  def received_payment
    PaymentMailer.received_payment
  end

end
