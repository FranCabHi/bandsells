class CartMailer < ApplicationMailer

  def approved_order(user)
    @user = user
    mail(
      to: @user.email,
      subject: 'Thank you for your purchase!'
    )
  end
end
