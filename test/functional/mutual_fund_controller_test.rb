require File.dirname(__FILE__) + '/../test_helper'
require 'mutual_fund_controller'

# Re-raise errors caught by the controller.
class MutualFundController; def rescue_action(e) raise e end; end

class MutualFundControllerTest < Test::Unit::TestCase
  fixtures :mutual_funds

  def setup
    @controller = MutualFundController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_refresh_prices
      assert_nil mutual_funds(:franklin_templeton).nav
      get :refresh_prices
      assert_response :redirect
      assert_redirected_to :action => 'index'
      assert_not_nil MutualFund.find(:first).nav
  end


=begin
  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:mutual_funds)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:mutual_fund)
    assert assigns(:mutual_fund).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:mutual_fund)
  end

  def test_create
    num_mutual_funds = MutualFund.count

    post :create, :mutual_fund => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_mutual_funds + 1, MutualFund.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:mutual_fund)
    assert assigns(:mutual_fund).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      MutualFund.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      MutualFund.find(@first_id)
    }
  end
=end

end
