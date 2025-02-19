require "test_helper"

class PointDecreasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @point_decrease = point_decreases(:one)
  end

  test "should get index" do
    get point_decreases_url
    assert_response :success
  end

  test "should get new" do
    get new_point_decrease_url
    assert_response :success
  end

  test "should create point_decrease" do
    assert_difference("PointDecrease.count") do
      post point_decreases_url, params: { point_decrease: {} }
    end

    assert_redirected_to point_decrease_url(PointDecrease.last)
  end

  test "should show point_decrease" do
    get point_decrease_url(@point_decrease)
    assert_response :success
  end

  test "should get edit" do
    get edit_point_decrease_url(@point_decrease)
    assert_response :success
  end

  test "should update point_decrease" do
    patch point_decrease_url(@point_decrease), params: { point_decrease: {} }
    assert_redirected_to point_decrease_url(@point_decrease)
  end

  test "should destroy point_decrease" do
    assert_difference("PointDecrease.count", -1) do
      delete point_decrease_url(@point_decrease)
    end

    assert_redirected_to point_decreases_url
  end
end
