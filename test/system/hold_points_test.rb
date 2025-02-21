require "application_system_test_case"

class HoldPointsTest < ApplicationSystemTestCase
  setup do
    @hold_point = hold_points(:one)
  end

  test "visiting the index" do
    visit hold_points_url
    assert_selector "h1", text: "Hold points"
  end

  test "should create hold point" do
    visit hold_points_url
    click_on "New hold point"

    click_on "Create Hold point"

    assert_text "Hold point was successfully created"
    click_on "Back"
  end

  test "should update Hold point" do
    visit hold_point_url(@hold_point)
    click_on "Edit this hold point", match: :first

    click_on "Update Hold point"

    assert_text "Hold point was successfully updated"
    click_on "Back"
  end

  test "should destroy Hold point" do
    visit hold_point_url(@hold_point)
    click_on "Destroy this hold point", match: :first

    assert_text "Hold point was successfully destroyed"
  end
end
