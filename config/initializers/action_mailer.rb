

Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
    address:              'smtp.sendgrid.net',
    port:                 587,
    #domain:               'gmail.com',
    user_name:            'apikey',
    password:             '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',
    authentication:       'plain',
    enable_starttls_auto: true
 }
Rails.application.config.action_mailer.raise_delivery_errors = true

#Rails.application.config.action_mailer.default_options ||= {}
#Rails.application.config.action_mailer.default_options[:content_type] = "text/html"
 

# For mailcatcher
#Rails.application.config.action_mailer.delivery_method = :smtp
#Rails.application.config.action_mailer.smtp_settings = { :address => '127.0.0.1', :port => 1025 }
#Rails.application.config.action_mailer.raise_delivery_errors = false
