ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> f60aefb84e6a000dbe20e59d041d0ef76f9ddbe4
module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors, with: :threads)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
<<<<<<< HEAD
=======
class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
>>>>>>> 619fbaf1af67af1e60365c9f190a873b6d7a3d5b
=======
>>>>>>> f60aefb84e6a000dbe20e59d041d0ef76f9ddbe4
end
