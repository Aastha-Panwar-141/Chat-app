class ChatChannel < ApplicationCable::Channel
  def subscribed
    # byebug
    stream_from "chat_channel"
    # console.log("running")
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_stream_from "chat_channel"
  end

  def speak(data)
    ActionCable.server.broadcast("chat_channel", message: data['message'])
    # Message.create!(content: data['message'], user: current_user, chat_room: current_chat_room)
  end
end
