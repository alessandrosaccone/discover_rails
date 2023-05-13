Rails.configuration.stripe = {
    publishable_key: 'pk_test_51N6vy0A60U57XjZBghMppU24yDeSC7wQb1HSqcOcZU12t1MKgYLWxhAfF5xxOD58jvM4WXdvMmnP5sFH0mVRB98700XRX8RXEl',
    secret_key: 'sk_test_51N6vy0A60U57XjZBEUBJe19s82Xuqr2wBSMNgfdec5pJBQIOHEZT1tLhOBs1aCRz1wKnA4tWy1Z7L694xoLWRjZD00gdUMtNi7'
  }
  
  Stripe.api_key = Rails.configuration.stripe[:secret_key]
  