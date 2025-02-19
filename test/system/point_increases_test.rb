require "application_system_test_case"

class PointIncreasesTest < ApplicationSystemTestCase
  setup do
    @point_increase = point_increases(:one)
  end

  test "visiting the index" do
    visit point_increases_url
    assert_selector "h1", text: "Point increases"
  end

  test "should create point increase" do
    visit point_increases_url
    click_on "New point increase"

    click_on "Create Point increase"

    assert_text "Point increase was successfully created"
    click_on "Back"
  end

  test "should update Point increase" do
    visit point_increase_url(@point_increase)
    click_on "Edit this point increase", match: :first

    click_on "Update Point increase"

    assert_text "Point increase was successfully updated"
    click_on "Back"
  end

  test "should destroy Point increase" do
    visit point_increase_url(@point_increase)
    click_on "Destroy this point increase", match: :first

    assert_text "Point increase was successfully destroyed"
  end
end
