class EmailController < ApplicationController
    def send_email
        user = current_user
        UserMailer.welcome_email(user).deliver_now
        puts "Email sent to #{user.email}!"
    end
end
