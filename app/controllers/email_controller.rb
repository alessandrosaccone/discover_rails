class EmailController < ApplicationController
    def send_email(booking)
      user = current_user
      begin
        # Create a path to the PDF file
        template = ERB.new(File.read("#{Rails.root}/app/views/invoices/invoice.html.erb"))
        result = template.result_with_hash(booking: self)
        pdf = WickedPdf.new.pdf_from_string(result)
        
        # Attach the PDF file to the email
        UserMailer.welcome_email(user, pdf).deliver
        
        puts "Email sent to #{user.email}!"
      rescue => e
        puts "Error sending email: #{e.message}"
      end
    end
  end
  
