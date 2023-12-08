import consumer from "channels/consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to ChatChannel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log("receive method")
    // Called when there's incoming data on the websocket for this channel
    $("#chat-messages").append("<p>" + data.message + "</p>");
  }
});
