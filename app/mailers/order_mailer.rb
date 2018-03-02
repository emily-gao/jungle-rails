class OrderMailer < ApplicationMailer

  def receipt_email(order)
    @order = order
    @url = orders_path
    mail(to: @order.email, subject: 'Your Jungles Order Was Received')
  end

end
