require File.dirname(__FILE__) + '/../test_helper'
require 'dividend_controller'

# Re-raise errors caught by the controller.
class DividendController; def rescue_action(e) raise e end; end

class DividendControllerTest < Test::Unit::TestCase
  def setup
    @controller = DividendController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
