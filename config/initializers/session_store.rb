# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_fucking_biggest_penis_session'

Rails.application.config.middleware.insert_before(
  ActionDispatch::Session::CookieStore,
  FlashSessionCookieMiddleware,
  Rails.application.config.session_options[:key]
)