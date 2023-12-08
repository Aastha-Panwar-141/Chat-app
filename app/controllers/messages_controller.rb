class MessagesController < ApplicationController
  # def create
  #   byebug
  #   @chatroom = Chatroom.find(params[:chatroom_id])
  #   @message = Message.create(message_params.merge(user: current_user, chatroom: @chatroom))
    
  #   respond_to do |format|
  #     format.js
  #   end
  # end
  
  def create
    # byebug
    @current_user = current_user
    @message = @current_user.messages.create(content: message_params[:content], chatroom_id: params[:chatroom_id])

    # @chatroom = Chatroom.find(params[:chatroom_id])
    # @message = @current_user.messages.create(content: message_params[:content], chatroom: @chatroom)
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
  
end
