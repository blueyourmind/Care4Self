// app/javascript/controllers/notification_controller.js
import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['notification'];

    close() {
      console.log("Close action executed");
      this.notificationTarget.classList.add("closed");
  }

  async closeNotification(notificationId) {
    try {
      const response = await fetch(`/notifications/${notificationId}`, {
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.head.querySelector('[name="csrf-token"]').content,
        },
      });

      if (!response.ok) {
        throw new Error(`Error closing notification: ${response.statusText}`);
      }

      this.notificationTarget.classList.add('closed');
      // Add additional logic here if needed
    } catch (error) {
      console.error(error);
    }
  }
}
