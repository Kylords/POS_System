class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_mailer.subject
  #
  def order_mailer(orderId)
    puts "pls email yo"
    puts "pls email yo"
    puts "pls email yo"
    puts orderId
    @order = Order.find(orderId)
    @sub_total = @order.total_price.to_i - 50 - @order.delivery.price.to_i


    mail to: @order.email
  end

  
end
