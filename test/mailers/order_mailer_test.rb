require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test "order_mailer" do
    mail = OrderMailer.order_mailer
    assert_equal "Order mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
