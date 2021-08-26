require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "approved_order" do
    mail = OrderMailer.approved_order
    assert_equal "Approved order", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
