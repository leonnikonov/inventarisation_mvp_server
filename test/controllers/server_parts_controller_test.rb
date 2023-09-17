require "test_helper"

class ServerPartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @server_part = server_parts(:one)
  end

  test "should get index" do
    get server_parts_url
    assert_response :success
  end

  test "should get new" do
    get new_server_part_url
    assert_response :success
  end

  test "should create server_part" do
    assert_difference("ServerPart.count") do
      post server_parts_url, params: { server_part: { name: @server_part.name } }
    end

    assert_redirected_to server_part_url(ServerPart.last)
  end

  test "should show server_part" do
    get server_part_url(@server_part)
    assert_response :success
  end

  test "should get edit" do
    get edit_server_part_url(@server_part)
    assert_response :success
  end

  test "should update server_part" do
    patch server_part_url(@server_part), params: { server_part: { name: @server_part.name } }
    assert_redirected_to server_part_url(@server_part)
  end

  test "should destroy server_part" do
    assert_difference("ServerPart.count", -1) do
      delete server_part_url(@server_part)
    end

    assert_redirected_to server_parts_url
  end
end
