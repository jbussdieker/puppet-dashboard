require 'openid/store/filesystem'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :google_apps
end
