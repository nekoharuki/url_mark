OmniAuth.config.allowed_request_methods = [ :post, :get ] # GETリクエストも許可
OmniAuth.config.silence_get_warning = true # GETリクエストの警告を抑制

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
    scope: "email,profile",
    prompt: "select_account",
    image_aspect_ratio: "square",
    image_size: 50,
    access_type: "offline"
  }
  provider :github, ENV["GITHUB_CLIENT_ID"], ENV["GITHUB_CLIENT_SECRET"], {
    scope: "user:email"
  }
end
