require File.dirname(__FILE__) + '/../test_helper'
require 'worth_controller'

# Re-raise errors caught by the controller.
class WorthController;
    def rescue_action(e)
        raise e
    end;
end

class WorthControllerTest < Test::Unit::TestCase
    def setup
        @controller = WorthController.new
        @request    = ActionController::TestRequest.new
        @response   = ActionController::TestResponse.new
    end

    def test_show_net_worth
        get :index
        investments = assigns(:investments)
        assert_equal 2, investments.size
    end

    def test_update_data
        post :update_data
        assert_response :redirect
        assert_redirected_to :action => 'index'
    end
end
