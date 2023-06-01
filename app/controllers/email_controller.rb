class EmailController < ApplicationController
  def send_email
    booking = Booking.find(params[:booking])
    pdf= booking.generate_invoice_pdf
    user = current_user
    begin
      # Attach the PDF file to the email
      UserMailer.welcome_email(user,pdf).deliver
      puts "Email sent to #{user.email}!"
    rescue => e
      puts "Error sending email: #{e.message}"
    end
  end
end
