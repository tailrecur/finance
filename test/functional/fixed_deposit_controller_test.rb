require File.dirname(__FILE__) + '/../test_helper'
require 'fixed_deposit_controller'

# Re-raise errors caught by the controller.
class FixedDepositController; def rescue_action(e) raise e end; end

class FixedDepositControllerTest < Test::Unit::TestCase
  fixtures :fixed_deposits

  def setup
    @controller = FixedDepositController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = fixed_deposits(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:fixed_deposits)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:fixed_deposit)
    assert assigns(:fixed_deposit).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:fixed_deposit)
  end

  def test_create
    num_fixed_deposits = FixedDeposit.count

    post :create, :fixed_deposit => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_fixed_deposits + 1, FixedDeposit.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:fixed_deposit)
    assert assigns(:fixed_deposit).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      FixedDeposit.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      FixedDeposit.find(@first_id)
    }
  end
end
