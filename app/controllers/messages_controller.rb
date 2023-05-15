class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages
  def index
    @messages = Message.all
  end

  # GET /messages/1
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.conversation_id = session[:current_conversation]
    @message.save


    ActionCable.server.broadcast "room_channel_#{@message.conversation_id}", html:  render_message
    redirect_back(fallback_location: root_path)


  end

  def render_message
    ApplicationController.renderer.instance_variable_set(
      :@env, {
        "HTTP_HOST"=>"localhost:3000",
        "HTTPS"=>'off',
        "REQUEST_METHOD"=>"GET",
        "SCRIPT_NAME"=>"",
        "warden"=>warden
      }
    )
    ApplicationController.render(
      partial: 'messages/message',
      locals: {
        message: @message
      }
    )
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      redirect_to @message, notice: "Message was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy
    redirect_to messages_url, notice: "Message was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:body, :user_id, :conversation_id)
    end
end
