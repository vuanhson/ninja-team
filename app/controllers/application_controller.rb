class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  $abc = 1
  def application
	I18n.locale = :en  	
  end
end
