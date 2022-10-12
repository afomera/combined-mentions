class SavedReplies::MentionsController < ApplicationController
  def index
    # TODO: Add in search functionality for saved replies, param will come across as query
    @saved_replies = SavedReply.all

    respond_to do |format|
      format.json
    end
  end
end
