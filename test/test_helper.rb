ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  
  def test_sign_in(user)
    controller.sign_in(user)
  end
  
  def integration_sign_in(user)
    visit signin_path
    fill_in :email, :with => user.email
    fill_in :password, :with => user.password 
    click_button
  end

end


