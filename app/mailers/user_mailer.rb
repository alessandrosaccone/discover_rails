class UserMailer < ApplicationMailer
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Welcome to My App')
        puts "Sending email to #{user.email}..." # added puts statement
    end

    def date_exceeded_email(user)
        @user = user
        mail(to: @user.email, subject: 'Date Exceeded')
      end
end
