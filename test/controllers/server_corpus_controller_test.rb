require "test_helper"

class ServerCorpusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @server_corpu = server_corpus(:one)
  end

  test "should get index" do
    get server_corpus_url
    assert_response :success
  end

  test "should get new" do
    get new_server_corpu_url
    assert_response :success
  end

  test "should create server_corpu" do
    assert_difference("ServerCorpu.count") do
      post server_corpus_url, params: { server_corpu: { name: @server_corpu.name } }
    end

    assert_redirected_to server_corpu_url(ServerCorpu.last)
  end

  test "should show server_corpu" do
    get server_corpu_url(@server_corpu)
    assert_response :success
  end

  test "should get edit" do
    get edit_server_corpu_url(@server_corpu)
    assert_response :success
  end

  test "should update server_corpu" do
    patch server_corpu_url(@server_corpu), params: { server_corpu: { name: @server_corpu.name } }
    assert_redirected_to server_corpu_url(@server_corpu)
  end

  test "should destroy server_corpu" do
    assert_difference("ServerCorpu.count", -1) do
      delete server_corpu_url(@server_corpu)
    end

    assert_redirected_to server_corpus_url
  end
end
