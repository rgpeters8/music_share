OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '519216251513422', '331dae2042d206131ecd7132f826a15b'
end