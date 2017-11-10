module.exports = {
  render () {
    form.className = "new-message";
    form.innerHTML = this.renderForm;
    return form;
  }
  
  renderForm () {
    let header = document.createElement("p");
    header.innerHTML = "New Message"
    header.className = "new-message-header";
    let form = document.createElement("form");
    let input1 = document.createElement("input");
    input1.className = "compose-form";
    input1.setAttribute("placeholder", "Recipient");
    input1.setAttribute("name", "subject");
    input1.setAttribute("type", "text");
    // input1.setAttribute("value", "");
    let input2 = document.createElement("input");
    input2.setAttribute("placeholder", "Subject");
    input2.setAttribute("name", "subject");
    input2.setAttribute("type", "text");
    // input2.setAttribute("value", "");
  }
}