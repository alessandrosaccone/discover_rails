class EmailController < ApplicationController
    def send_email
        user = current_user
        begin
            UserMailer.welcome_email(user).deliver
            puts "Email sent to #{user.email}!"
        rescue => e
            puts "Error sending email: #{e.message}"
        end
    end
end
