class DOMNodeCollection {
  constructor(array) {
    this.array = array;
  }
  
  each(cb) {
    this.array.forEach(el => cb(el));
  }
  
  empty() {
    this.html("");
  }
  
  append(content) {
    this.each((el) =>{
      el.innerHTML += content;
    })
  }
  
  remove(){
    
  }
  
  attr(attribute, value) {
    this.each((el) => {
      el.setAttribute(attribute, value);
    })
  }
  
  addClass(value) {
    this.attr('class', value);
  }
  
  removeClass() {
    this.each((el) => {
      el.removeAttribute('class');
    })
  }
  
  html(string) {
    if (string) {
      this.each(el => el.innerHTML = string);
    }else{
      return this.array[0].innerHTML;
    }
  }
  
  find(){
    
  }
  
  children(){
    
  }
  
  parent(){
    
  }
}

module.exports = DOMNodeCollection;