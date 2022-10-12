require "test_helper"

class SavedRepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saved_reply = saved_replies(:one)
  end

  test "should get index" do
    get saved_replies_url
    assert_response :success
  end

  test "should get new" do
    get new_saved_reply_url
    assert_response :success
  end

  test "should create saved_reply" do
    assert_difference("SavedReply.count") do
      post saved_replies_url, params: { saved_reply: { title: @saved_reply.title } }
    end

    assert_redirected_to saved_reply_url(SavedReply.last)
  end

  test "should show saved_reply" do
    get saved_reply_url(@saved_reply)
    assert_response :success
  end

  test "should get edit" do
    get edit_saved_reply_url(@saved_reply)
    assert_response :success
  end

  test "should update saved_reply" do
    patch saved_reply_url(@saved_reply), params: { saved_reply: { title: @saved_reply.title } }
    assert_redirected_to saved_reply_url(@saved_reply)
  end

  test "should destroy saved_reply" do
    assert_difference("SavedReply.count", -1) do
      delete saved_reply_url(@saved_reply)
    end

    assert_redirected_to saved_replies_url
  end
end
