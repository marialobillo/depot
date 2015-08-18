class OrderNotifier < ApplicationMailer

  default from: 'Maria Lobillo < depot@example.org>'

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
  def shipped(order)
    @order = order

    mail to: order.email, subject: "Hello, Store Order Shipped"
  end
end
