require File.dirname(__FILE__) + '/../test_helper'
require 'mutual_fund_investment_controller'

# Re-raise errors caught by the controller.
class MutualFundInvestmentController;
    def rescue_action(e)
        raise e
    end;
end

class MutualFundInvestmentControllerTest < Test::Unit::TestCase
    fixtures :mutual_fund_investments

    def setup
        @controller = MutualFundInvestmentController.new
        @request    = ActionController::TestRequest.new
        @response   = ActionController::TestResponse.new
    end

    def test_update_calculations
        post :update_calculations
        assert_response :redirect
        assert_redirected_to :action => 'index'
        assert_not_nil MutualFundInvestment.find(:first).current_value
    end

    #  def test_index
    #    get :index
    #    assert_response :success
    #    assert_template 'list'
    #  end
    #
    #  def test_list
    #    get :list
    #
    #    assert_response :success
    #    assert_template 'list'
    #
    #    assert_not_nil assigns(:mutual_fund_investments)
    #  end
    #
    #  def test_show
    #    get :show, :id => @first_id
    #
    #    assert_response :success
    #    assert_template 'show'
    #
    #    assert_not_nil assigns(:mutual_fund_investment)
    #    assert assigns(:mutual_fund_investment).valid?
    #  end
    #
    #  def test_new
    #    get :new
    #
    #    assert_response :success
    #    assert_template 'new'
    #
    #    assert_not_nil assigns(:mutual_fund_investment)
    #  end
    #
    #  def test_create
    #    num_mutual_fund_investments = MutualFundInvestment.count
    #
    #    post :create, :mutual_fund_investment => {}
    #
    #    assert_response :redirect
    #    assert_redirected_to :action => 'list'
    #
    #    assert_equal num_mutual_fund_investments + 1, MutualFundInvestment.count
    #  end
    #
    #  def test_edit
    #    get :edit, :id => @first_id
    #
    #    assert_response :success
    #    assert_template 'edit'
    #
    #    assert_not_nil assigns(:mutual_fund_investment)
    #    assert assigns(:mutual_fund_investment).valid?
    #  end
    #
    #  def test_update
    #    post :update, :id => @first_id
    #    assert_response :redirect
    #    assert_redirected_to :action => 'show', :id => @first_id
    #  end
    #
    #  def test_destroy
    #    assert_nothing_raised {
    #      MutualFundInvestment.find(@first_id)
    #    }
    #
    #    post :destroy, :id => @first_id
    #    assert_response :redirect
    #    assert_redirected_to :action => 'list'
    #
    #    assert_raise(ActiveRecord::RecordNotFound) {
    #      MutualFundInvestment.find(@first_id)
    #    }
    #  end
end
