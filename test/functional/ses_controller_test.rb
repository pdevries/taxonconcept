require 'test_helper'

class SesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create se" do
    assert_difference('Se.count') do
      post :create, :se => { }
    end

    assert_redirected_to se_path(assigns(:se))
  end

  test "should show se" do
    get :show, :id => ses(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ses(:one).to_param
    assert_response :success
  end

  test "should update se" do
    put :update, :id => ses(:one).to_param, :se => { }
    assert_redirected_to se_path(assigns(:se))
  end

  test "should destroy se" do
    assert_difference('Se.count', -1) do
      delete :destroy, :id => ses(:one).to_param
    end

    assert_redirected_to ses_path
  end
end
