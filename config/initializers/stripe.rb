Rails.configuration.stripe = {
    publishable_key: 'pk_test_51N6vy0A60U57XjZBghMppU24yDeSC7wQb1HSqcOcZU12t1MKgYLWxhAfF5xxOD58jvM4WXdvMmnP5sFH0mVRB98700XRX8RXEl',
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
  
Stripe.api_key = Rails.configuration.stripe[:secret_key]

#puts Rails.configuration.stripe[:publishable_key]
#puts Rails.configuration.stripe[:secret_key]
#puts Stripe.api_key
    