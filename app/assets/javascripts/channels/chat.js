document.addEventListener('DOMContentLoaded', function() {
    const chatChannel = consumer.subscriptions.create('ChatChannel', {
      connected() {
        // Called when the subscription is ready for use on the server
        console.log('Connected to chat channel');
      },
      disconnected() {
        // Called when the subscription has been terminated by the server
        console.log('Disconnected from chat channel');
      },
      received(data) {
        // Called when there's incoming data on the websocket for this channel
        const messages = document.getElementById('messages');
        messages.insertAdjacentHTML('beforeend', data.message);
      },
      speak(message) {
        // Called when the client wants to send a message to the server
        return this.perform('speak', { message: message });
      }
    });
    // Example: sending a message when a form is submitted
    document.querySelector('form').addEventListener('submit', function(e) {
      e.preventDefault();
      const messageContent = e.target.querySelector('textarea').value;
      chatChannel.speak(messageContent);
      e.target.querySelector('textarea').value = '';
    });

    document.addEventListener('DOMContentLoaded', function() {
        const messages = document.getElementById('messages');
        const chatChannel = consumer.subscriptions.create('ChatChannel', {
          received: function(data) {
            messages.insertAdjacentHTML('beforeend', data.message);
          },
          speak: function(message) {
            return this.perform('speak', { message: message });
          }
        });
        document.querySelector('form').addEventListener('submit', function(e) {
          e.preventDefault();
          const messageContent = e.target.querySelector('textarea').value;
          chatChannel.speak(messageContent);
          e.target.querySelector('textarea').value = '';
        });
    });
  });