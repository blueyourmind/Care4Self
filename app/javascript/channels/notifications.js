// app/assets/javascripts/channels/notifications.js

App.notifications = App.cable.subscriptions.create({
  channel: 'NotificationsChannel'
}, {
  received: function(data) {
    // Handle the received data, e.g., display the notification message
    alert(data.message);
  }
});

