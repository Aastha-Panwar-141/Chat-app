class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
    @users = User.all
    @chatroom = Chatroom.new
    # @single_room = Chatroom.find(params[:id])

  end
  def show
    byebug
    @single_room = Chatroom.find(params[:id])
    @chatroom = Chatroom.all
    @message = Message.new
    @messages = @single_room.messages
    # @chatroom = Chatroom.find(params[:id])
    render "index"
  end
  def new
    @chatroom = Chatroom.new
  end
  def create
    # @chatroom = Chatroom.create(chatroom_params)
    @chatroom = Chatroom.create(name: params["chatroom"]["name"])
    redirect_to @chatroom
  end
  private
  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
