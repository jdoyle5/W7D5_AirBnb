module.exports = {
  render () {
    let ul = document.createElement("ul");
    ul.className = "messages";
    ul.innerHTML = "A Sent Message";
    return ul;
  }
}