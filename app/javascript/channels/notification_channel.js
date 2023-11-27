// app/assets/javascripts/channels/notifications_channel.js
import consumer from "./consumer";

consumer.subscriptions.create("NotificationsChannel", {
  received(data) {
    // Handle incoming notification data
    console.log(data.message);

    // Update your UI to display the notification
    const container = document.getElementById("notifications-container");
    container.innerHTML += `<div>${data.message}</div>`;
  }
});
