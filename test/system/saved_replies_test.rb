require "application_system_test_case"

class SavedRepliesTest < ApplicationSystemTestCase
  setup do
    @saved_reply = saved_replies(:one)
  end

  test "visiting the index" do
    visit saved_replies_url
    assert_selector "h1", text: "Saved replies"
  end

  test "should create saved reply" do
    visit saved_replies_url
    click_on "New saved reply"

    fill_in "Title", with: @saved_reply.title
    click_on "Create Saved reply"

    assert_text "Saved reply was successfully created"
    click_on "Back"
  end

  test "should update Saved reply" do
    visit saved_reply_url(@saved_reply)
    click_on "Edit this saved reply", match: :first

    fill_in "Title", with: @saved_reply.title
    click_on "Update Saved reply"

    assert_text "Saved reply was successfully updated"
    click_on "Back"
  end

  test "should destroy Saved reply" do
    visit saved_reply_url(@saved_reply)
    click_on "Destroy this saved reply", match: :first

    assert_text "Saved reply was successfully destroyed"
  end
end
