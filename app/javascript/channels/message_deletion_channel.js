import consumer from "./consumer";

document.addEventListener("DOMContentLoaded", () => {
  if (!document.getElementById("room-id")) {
    return;
  }
  const room_id = Number(
    document.getElementById("room-id").getAttribute("data-room-id")
  );
  consumer.subscriptions.create(
    { channel: "MessageDeletionChannel", room_id: room_id },
    {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        var id = data.message_id;
        const daEliminare = document.getElementById(id);
        if (daEliminare) {
          daEliminare.remove();
        }
      },
    }
  );
});
