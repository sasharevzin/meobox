Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1635269040125021', 'f3976474b2ea4910baa895632f0e9036'
end