// app/assets/javascripts/channels/notifications.coffee
App.notifications = App.cable.subscriptions.create('NotificationsChannel', {
  received: function(data) {
    // Handle the received data and display notifications on the UI
    console.log(data.message);
    // Add logic to display notifications (e.g., using a notification library)
  }
});
