import consumer from "./consumer";

consumer.subscriptions.create("UserNotificationChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel

    const notifCont = document.getElementById("notification-container");
    const tr = document.createElement("tr");
    notifCont.append(tr);
    const td = document.createElement("td");
    tr.append(td);

    const link = document.createElement("a");
    link.href = data["notification_url"];
    link.textContent = data["user"] + ": " + data["content"];
    td.append(link);

    //Faccio diventare rossa la campanella
    const campanella = document.getElementById("icon-notif");
    campanella.classList.add("notifications");
  },
});
