class MessageBroadcastJob < ApplicationJob
  queue_as :default

  # def perform(*args)
  #   # Do something later
  # end

  def perform(message)
    ActionCable.server.broadcast('chat_channel', message: render_message(message))
  end

  private

  def render_message(message)
    ApplicationController.render(
      partial: 'messages/message',
      locals: {message: message}
    )
  end
end
