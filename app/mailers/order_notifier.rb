class OrderNotifier < ApplicationMailer

  default from: 'Maria Lobillo < depot@okzen.com>'

  def received(order)
    @order = order
    @greeting = "Hi"

    mail to: order.email, subject: 'Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
