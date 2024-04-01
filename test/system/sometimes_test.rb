require "application_system_test_case"

class SometimesTest < ApplicationSystemTestCase
  setup do
    @sometime = sometimes(:one)
  end

  test "visiting the index" do
    visit sometimes_url
    assert_selector "h1", text: "Sometimes"
  end

  test "should create sometime" do
    visit sometimes_url
    click_on "New sometime"

    check "Completed" if @sometime.completed
    fill_in "Name", with: @sometime.name
    fill_in "Trip", with: @sometime.trip_id
    click_on "Create Sometime"

    assert_text "Sometime was successfully created"
    click_on "Back"
  end

  test "should update Sometime" do
    visit sometime_url(@sometime)
    click_on "Edit this sometime", match: :first

    check "Completed" if @sometime.completed
    fill_in "Name", with: @sometime.name
    fill_in "Trip", with: @sometime.trip_id
    click_on "Update Sometime"

    assert_text "Sometime was successfully updated"
    click_on "Back"
  end

  test "should destroy Sometime" do
    visit sometime_url(@sometime)
    click_on "Destroy this sometime", match: :first

    assert_text "Sometime was successfully destroyed"
  end
end
