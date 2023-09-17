require "application_system_test_case"

class ServerCorpusTest < ApplicationSystemTestCase
  setup do
    @server_corpu = server_corpus(:one)
  end

  test "visiting the index" do
    visit server_corpus_url
    assert_selector "h1", text: "Server corpus"
  end

  test "should create server corpu" do
    visit server_corpus_url
    click_on "New server corpu"

    fill_in "Name", with: @server_corpu.name
    click_on "Create Server corpu"

    assert_text "Server corpu was successfully created"
    click_on "Back"
  end

  test "should update Server corpu" do
    visit server_corpu_url(@server_corpu)
    click_on "Edit this server corpu", match: :first

    fill_in "Name", with: @server_corpu.name
    click_on "Update Server corpu"

    assert_text "Server corpu was successfully updated"
    click_on "Back"
  end

  test "should destroy Server corpu" do
    visit server_corpu_url(@server_corpu)
    click_on "Destroy this server corpu", match: :first

    assert_text "Server corpu was successfully destroyed"
  end
end
