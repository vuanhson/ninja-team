require 'rack/utils'

class FlashSessionCookieMiddleware
  def initialize app, session_key = '_session_id'
    @app = app
    @session_key = session_key
  end

  def call env
    if env['HTTP_USER_AGENT'] =~ /^(Adobe|Shockwave) Flash/
      request = Rack::Request.new env
      env['HTTP_COOKIE'] = [@session_key, request.params[@session_key]].join('=').freeze unless request.params[@session_key].nil?
      env['HTTP_ACCEPT'] = "#{request.params['_http_accept']}".freeze unless request.params['_http_accept'].nil?
    end

    @app.call env
  end
end