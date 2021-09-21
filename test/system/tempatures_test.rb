require "application_system_test_case"

class TempaturesTest < ApplicationSystemTestCase
  setup do
    @tempature = tempatures(:one)
  end

  test "visiting the index" do
    visit tempatures_url
    assert_selector "h1", text: "Tempatures"
  end

  test "creating a Tempature" do
    visit tempatures_url
    click_on "New Tempature"

    fill_in "Date", with: @tempature.date
    fill_in "Temp", with: @tempature.temp
    fill_in "Time", with: @tempature.time
    click_on "Create Tempature"

    assert_text "Tempature was successfully created"
    click_on "Back"
  end

  test "updating a Tempature" do
    visit tempatures_url
    click_on "Edit", match: :first

    fill_in "Date", with: @tempature.date
    fill_in "Temp", with: @tempature.temp
    fill_in "Time", with: @tempature.time
    click_on "Update Tempature"

    assert_text "Tempature was successfully updated"
    click_on "Back"
  end

  test "destroying a Tempature" do
    visit tempatures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tempature was successfully destroyed"
  end
end
