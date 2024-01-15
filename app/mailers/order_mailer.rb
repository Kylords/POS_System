class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.order_mailer.subject
  #
  def order_mailer(orderId)
    puts orderId
    @order = Order.find(orderId)
    @sub_total = @order.total_price.to_i - 50 - @order.delivery.price.to_i
    @address = [
      @order.nearest_landmark,
      @order.remarks, 
      @order.building,
      @order.floor, 
      @order.room_unit, 
      @order.street, 
      @order.baranggay, 
      @order.city,
      @order.province, 
  ].reject(&:empty?).join(', ')
    @address = 'In-Store' if @order.order_type == 'In-Store'


    mail to: @order.email
  end

  
end
