require File.dirname(__FILE__) + '/../test_helper'
require 'asset_controller'

# Re-raise errors caught by the controller.
class AssetController; def rescue_action(e) raise e end; end

class AssetControllerTest < Test::Unit::TestCase
  def setup
    @controller = AssetController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
