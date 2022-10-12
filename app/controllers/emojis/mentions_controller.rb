class Emojis::MentionsController < ApplicationController
  def index
    @emojis = Emoji.all - Emoji.all.select(&:custom?)

    respond_to do |format|
      format.json
    end
  end
end
