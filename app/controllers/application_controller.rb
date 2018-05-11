class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authentication, if: proc { Rails.env.production? }

  private

  def authentication
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'lex' && password == 'isawesome'
    end
  end
end
