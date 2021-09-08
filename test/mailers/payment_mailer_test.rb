require 'test_helper'

class PaymentMailerTest < ActionMailer::TestCase
  test "received_payment" do
    mail = PaymentMailer.received_payment
    assert_equal "Received payment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
