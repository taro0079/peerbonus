require "test_helper"

class PointIncreasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @point_increase = point_increases(:one)
  end

  test "should get index" do
    get point_increases_url
    assert_response :success
  end

  test "should get new" do
    get new_point_increase_url
    assert_response :success
  end

  test "should create point_increase" do
    assert_difference("PointIncrease.count") do
      post point_increases_url, params: { point_increase: {} }
    end

    assert_redirected_to point_increase_url(PointIncrease.last)
  end

  test "should show point_increase" do
    get point_increase_url(@point_increase)
    assert_response :success
  end

  test "should get edit" do
    get edit_point_increase_url(@point_increase)
    assert_response :success
  end

  test "should update point_increase" do
    patch point_increase_url(@point_increase), params: { point_increase: {} }
    assert_redirected_to point_increase_url(@point_increase)
  end

  test "should destroy point_increase" do
    assert_difference("PointIncrease.count", -1) do
      delete point_increase_url(@point_increase)
    end

    assert_redirected_to point_increases_url
  end
end
