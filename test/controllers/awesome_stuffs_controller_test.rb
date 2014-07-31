require 'test_helper'

class AwesomeStuffsControllerTest < ActionController::TestCase
  setup do
    @awesome_stuff = awesome_stuffs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:awesome_stuffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create awesome_stuff" do
    assert_difference('AwesomeStuff.count') do
      post :create, awesome_stuff: { name: @awesome_stuff.name }
    end

    assert_redirected_to awesome_stuff_path(assigns(:awesome_stuff))
  end

  test "should show awesome_stuff" do
    get :show, id: @awesome_stuff
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @awesome_stuff
    assert_response :success
  end

  test "should update awesome_stuff" do
    patch :update, id: @awesome_stuff, awesome_stuff: { name: @awesome_stuff.name }
    assert_redirected_to awesome_stuff_path(assigns(:awesome_stuff))
  end

  test "should destroy awesome_stuff" do
    assert_difference('AwesomeStuff.count', -1) do
      delete :destroy, id: @awesome_stuff
    end

    assert_redirected_to awesome_stuffs_path
  end
end
