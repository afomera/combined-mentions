class SavedRepliesController < ApplicationController
  before_action :set_saved_reply, only: %i[ show edit update destroy ]

  # GET /saved_replies or /saved_replies.json
  def index
    @saved_replies = SavedReply.all
  end

  # GET /saved_replies/1 or /saved_replies/1.json
  def show
  end

  # GET /saved_replies/new
  def new
    @saved_reply = SavedReply.new
  end

  # GET /saved_replies/1/edit
  def edit
  end

  # POST /saved_replies or /saved_replies.json
  def create
    @saved_reply = SavedReply.new(saved_reply_params)

    respond_to do |format|
      if @saved_reply.save
        format.html { redirect_to saved_reply_url(@saved_reply), notice: "Saved reply was successfully created." }
        format.json { render :show, status: :created, location: @saved_reply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @saved_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saved_replies/1 or /saved_replies/1.json
  def update
    respond_to do |format|
      if @saved_reply.update(saved_reply_params)
        format.html { redirect_to saved_reply_url(@saved_reply), notice: "Saved reply was successfully updated." }
        format.json { render :show, status: :ok, location: @saved_reply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @saved_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_replies/1 or /saved_replies/1.json
  def destroy
    @saved_reply.destroy

    respond_to do |format|
      format.html { redirect_to saved_replies_url, notice: "Saved reply was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saved_reply
      @saved_reply = SavedReply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def saved_reply_params
      params.require(:saved_reply).permit(:title, :body)
    end
end
