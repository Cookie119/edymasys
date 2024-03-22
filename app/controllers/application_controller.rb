class ApplicationController < ActionController::Base
<<<<<<< HEAD
    before_action :set_headers


    private

  def set_headers
    response.headers['X-Content-Type-Options'] = 'nosniff'
  end
=======
>>>>>>> 619fbaf1af67af1e60365c9f190a873b6d7a3d5b
end
