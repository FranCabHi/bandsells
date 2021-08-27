class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.approved_order.subject
  #
  def approved_order
    @greeting = "Hi"

    mail(
      to: "f.cabrerahiche@yahoo.es",
      subject: "prueba correo"    
    )
  end
end
