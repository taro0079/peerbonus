require "application_system_test_case"

class PointDecreasesTest < ApplicationSystemTestCase
  setup do
    @point_decrease = point_decreases(:one)
  end

  test "visiting the index" do
    visit point_decreases_url
    assert_selector "h1", text: "Point decreases"
  end

  test "should create point decrease" do
    visit point_decreases_url
    click_on "New point decrease"

    click_on "Create Point decrease"

    assert_text "Point decrease was successfully created"
    click_on "Back"
  end

  test "should update Point decrease" do
    visit point_decrease_url(@point_decrease)
    click_on "Edit this point decrease", match: :first

    click_on "Update Point decrease"

    assert_text "Point decrease was successfully updated"
    click_on "Back"
  end

  test "should destroy Point decrease" do
    visit point_decrease_url(@point_decrease)
    click_on "Destroy this point decrease", match: :first

    assert_text "Point decrease was successfully destroyed"
  end
end
