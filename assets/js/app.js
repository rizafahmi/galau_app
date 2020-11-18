import "../css/app.scss"

//     import {Socket} from "phoenix"
import socket from "./socket.js"

let channel = socket.channel("room:lobby", {})
channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

const voteButtons = document.querySelectorAll("button");

for(let i=0; i<voteButtons.length; i++) {
  voteButtons[i].addEventListener('click', function(){
    const id = voteButtons[i].dataset.id;
    channel.push("increment", {id: id})
  })
}

channel.on("change_data", function(data) {
  render(data)
})

function render({id, count}) {
  document.querySelector(`#vote-${id}`).textContent = count;
}

import "phoenix_html"
