import consumer from "./consumer";

document.addEventListener("DOMContentLoaded", () => {
  if (!document.getElementById("room-id")) {
    return;
  }
  const room_id = Number(
    document.getElementById("room-id").getAttribute("data-room-id")
  );
  consumer.subscriptions.create(
    { channel: "RoomChannel", room_id: room_id },
    {
      connected() {
        console.log("Connected to channel " + room_id);
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        console.log("Disconnected from channel");
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        console.log(data);

        // Called when there's incoming data on the websocket for this channel
        data.html = data.html.replace("my-message", "not-my-message");
        const messageContainer = document.getElementById("messages-container");
        messageContainer.innerHTML = messageContainer.innerHTML + data.html;
      },
    }
  );
});
