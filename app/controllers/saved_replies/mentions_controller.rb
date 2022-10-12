class SavedReplies::MentionsController < ApplicationController
  def index
    @saved_replies = SavedReply.all

    respond_to do |format|
      format.json
    end
  end
end
