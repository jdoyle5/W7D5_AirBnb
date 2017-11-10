const Inbox = require("./inbox.js")
const Compose = require("./compose.js")
const Sent = require("./sent.js")

class Router {
  constructor(node) {
    this.node = node;
  }
  
  start() {
    window.addEventListener("hashchange", this.render.bind(this));
  }
  
  render() {
    this.node.innerHTML = "";
    let name = this.activeRoute();
    let newEl = document.createElement("div")
    if (name === "inbox") {
      newEl.appendChild(Inbox.render());
    } else if (name === "sent") {
      newEl.appendChild(Sent.render());
    }
    // newEl.innerHTML = name;
    this.node.appendChild(newEl);
    console.log("The render is working");
  }
  
  activeRoute() {
    let hash = window.location.hash;
    return hash.slice(1);
  }
}

module.exports = Router;