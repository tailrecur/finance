require File.dirname(__FILE__) + '/../test_helper'
require 'bank_controller'

# Re-raise errors caught by the controller.
class BankController; def rescue_action(e) raise e end; end

class BankControllerTest < Test::Unit::TestCase
  def setup
    @controller = BankController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
