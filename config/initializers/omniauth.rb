OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '598200456928335', '436fd2086f524e7fd3d643f33a387c81'
end