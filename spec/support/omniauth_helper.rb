module OmniauthHelper
  def mock_omniauth(base_overrides: {}, info_overrides: {})
    info_defaults = {
      nickname: 'TriptionaryTK'
    }

    base_defaults = {
      provider: 'twitter',
      uid: '2314806716',
      info: info_defaults.merge(info_overrides),
      credentials: {:token => "2314806716-wXhzOhqpXWc4f74cTtjvHgQtIuYc1f3ODjieVge", :secret => "WfC7yEWsrRSoIITn9HP3XFbRKT8J3A1ULMLBZCBXBE4T9"}
    }
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(base_defaults.merge(base_overrides))
  end
end
