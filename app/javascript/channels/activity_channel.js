import consumer from "./consumer";

consumer.subscriptions.create("ActivityChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    this.perform("appear");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel

    let elements = document.getElementsByClassName(
      "activity-status-" + data.user_id
    );

    for (var i = 0; i < elements.length; i++) {
      if (data.status === "online") {
        elements[i].classList.remove("offline");
        elements[i].classList.add("online");
      } else if (data.status === "offline") {
        elements[i].classList.remove("online");
        elements[i].classList.add("offline");
      } else {
        console.log("Unexpected error showing status!");
        return;
      }
      elements[i].classList.add(data.status);
    }
  },
});
