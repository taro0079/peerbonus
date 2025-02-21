require "test_helper"

class HoldPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hold_point = hold_points(:one)
  end

  test "should get index" do
    get hold_points_url
    assert_response :success
  end

  test "should get new" do
    get new_hold_point_url
    assert_response :success
  end

  test "should create hold_point" do
    assert_difference("HoldPoint.count") do
      post hold_points_url, params: { hold_point: {} }
    end

    assert_redirected_to hold_point_url(HoldPoint.last)
  end

  test "should show hold_point" do
    get hold_point_url(@hold_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_hold_point_url(@hold_point)
    assert_response :success
  end

  test "should update hold_point" do
    patch hold_point_url(@hold_point), params: { hold_point: {} }
    assert_redirected_to hold_point_url(@hold_point)
  end

  test "should destroy hold_point" do
    assert_difference("HoldPoint.count", -1) do
      delete hold_point_url(@hold_point)
    end

    assert_redirected_to hold_points_url
  end
end
