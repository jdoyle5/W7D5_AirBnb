const Router = require('./router.js')
const Inbox = require('./inbox.js')
const Sent = require('./sent.js')
const Compose = require('./compose.js')

document.addEventListener("DOMContentLoaded", () => {
  const changeHash = (e) => {
    let li = e.target;
    let iText = li.innerText;
    let loweriText = iText.toLowerCase();
    window.location.hash = loweriText;
  };
  
  document.querySelectorAll(".sidebar-nav li").forEach((li) => {
    li.addEventListener("click", changeHash) 
  });
  
  let node = document.querySelector(".content")
  let router = new Router(node);
  router.start();
});

routes = {
  compose: compose,
  inbox: inbox,
  sent: sent
}
