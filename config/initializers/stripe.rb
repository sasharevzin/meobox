Rails.configuration.stripe = {
  :publishable_key => Rails.application.secrets.PUBLISHABLE_KEY,
  :secret_key      => Rails.application.secrets.SECRET_KEY
}

Stripe.api_key = Rails.application.secrets.SECRET_KEY