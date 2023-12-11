class ChatroomsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to '/users/sign_in' unless @current_user
    @chatrooms = Chatroom.all
    @users = User.all
    @chatroom = Chatroom.new
    # @single_room = Chatroom.find(params[:id])

  end
  def show
    # byebug
    @current_user = current_user
    @single_room = Chatroom.find(params[:id])
    @chatrooms = Chatroom.all
    @message = Message.new
    @chatroom = Chatroom.new
    @messages = @single_room.messages
    # @chatroom = Chatroom.find(params[:id])
    @users = User.all
    render "index"
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    # @chatroom = Chatroom.create(chatroom_params)
    @chatroom = Chatroom.create(name: params["chatroom"]["name"])
    redirect_to @chatroom
    # redirect_to chatroom_path
  end
  private
  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
