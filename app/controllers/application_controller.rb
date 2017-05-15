class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include EmojiHelper

  def application
	I18n.locale = :en
  end
end
