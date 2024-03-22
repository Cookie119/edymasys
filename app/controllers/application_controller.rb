class ApplicationController < ActionController::Base
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> f60aefb84e6a000dbe20e59d041d0ef76f9ddbe4
    before_action :set_headers


    private

  def set_headers
    response.headers['X-Content-Type-Options'] = 'nosniff'
  end
<<<<<<< HEAD
=======
>>>>>>> 619fbaf1af67af1e60365c9f190a873b6d7a3d5b
=======
>>>>>>> f60aefb84e6a000dbe20e59d041d0ef76f9ddbe4
end
