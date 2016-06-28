OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '153892268362744
', 'bf0843ea1f0d7d966c499e4926356d61'
end


 