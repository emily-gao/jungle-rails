class OrderMailerPreview < ActionMailer::Preview
  def receipt_email
    OrderMailer.receipt_email(Order.first)
  end
end
