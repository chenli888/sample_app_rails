OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '146385372213450', 'b09ef9047609a5e20e0042eb69ad070f'
end