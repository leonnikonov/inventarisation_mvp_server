require "application_system_test_case"

class ServerPartsTest < ApplicationSystemTestCase
  setup do
    @server_part = server_parts(:one)
  end

  test "visiting the index" do
    visit server_parts_url
    assert_selector "h1", text: "Server parts"
  end

  test "should create server part" do
    visit server_parts_url
    click_on "New server part"

    fill_in "Name", with: @server_part.name
    click_on "Create Server part"

    assert_text "Server part was successfully created"
    click_on "Back"
  end

  test "should update Server part" do
    visit server_part_url(@server_part)
    click_on "Edit this server part", match: :first

    fill_in "Name", with: @server_part.name
    click_on "Update Server part"

    assert_text "Server part was successfully updated"
    click_on "Back"
  end

  test "should destroy Server part" do
    visit server_part_url(@server_part)
    click_on "Destroy this server part", match: :first

    assert_text "Server part was successfully destroyed"
  end
end
