
Devise.setup do |config|
 
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  
  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  
  config.omniauth :facebook, "317310668662280", "44f641e5d1a0c8c2fc86b03699173dde"
  config.omniauth :twitter, "kN6I6UmgeKDgX8jZYGv6sNixE", "nyopuqPxydAPDfpLrEuaTKhPBGxq40ap2EkjaRgFW15GKtQTzz"
  config.omniauth :vkontakte, "5741272", "QaBfNP30Ku3dnSM9V6bu"
  
end
