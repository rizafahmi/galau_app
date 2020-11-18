import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

// Finally, connect to the socket:
socket.connect()

// Now that you are connected, you can join channels with a topic:
let channel = socket.channel("room:lobby", {})
channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

channel.push("new_msg", {body: "Hello, Channel!"})

channel.on("new_msg", function(payload) {
  console.log(`From server: ${payload.body}`)
})

export default socket
