class EmailController < ApplicationController
    def send_email
        user = current_user
        UserMailer.welcome_email(user).deliver_now
        puts "Email sent to #{user.email}!"
    rescue StandardError => e
        flash[:error] = "There was an error sending the email: #{e.message}"
        puts "Error sending email to #{user.email}: #{e.message}"
    end
end
