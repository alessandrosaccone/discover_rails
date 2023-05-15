

Rails.application.config.action_mailer.delivery_method = :smtp
Rails.application.config.action_mailer.smtp_settings = {
    address:              'smtp.sendgrid.net',
    port:                 587,
    #domain:               'libero.it',
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
