require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Store Order Confirmation", mail.subject
    assert_equal ["order@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match "Programming Ruby 2.2", mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Store Order Confirmation", mail.subject
    assert_equal ["order@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
