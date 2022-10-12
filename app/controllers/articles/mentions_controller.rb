class Articles::MentionsController < ApplicationController
  def index
    # TODO: Add in search functionality for Articles, param will come across as query
    @articles = Article.all

    respond_to do |format|
      format.json
    end
  end
end
