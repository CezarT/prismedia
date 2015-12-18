require 'test_helper'

class MediaOutletsControllerTest < ActionController::TestCase
  setup do
    @media_outlet = media_outlets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:media_outlets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create media_outlet" do
    assert_difference('MediaOutlet.count') do
      post :create, media_outlet: { title: @media_outlet.title, type: @media_outlet.type, url: @media_outlet.url }
    end

    assert_redirected_to media_outlet_path(assigns(:media_outlet))
  end

  test "should show media_outlet" do
    get :show, id: @media_outlet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @media_outlet
    assert_response :success
  end

  test "should update media_outlet" do
    patch :update, id: @media_outlet, media_outlet: { title: @media_outlet.title, type: @media_outlet.type, url: @media_outlet.url }
    assert_redirected_to media_outlet_path(assigns(:media_outlet))
  end

  test "should destroy media_outlet" do
    assert_difference('MediaOutlet.count', -1) do
      delete :destroy, id: @media_outlet
    end

    assert_redirected_to media_outlets_path
  end
end
