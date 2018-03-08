OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '268208445361-hefj5g5dmmae7t0emuca1pnn0j1c8s0e.apps.googleusercontent.com', 'zdoweuxQeMm7tjTyzw7NhNye', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end