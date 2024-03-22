class ApplicationController < ActionController::Base
    before_action :set_headers


    private

  def set_headers
    response.headers['X-Content-Type-Options'] = 'nosniff'
  end
end
