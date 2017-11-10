const DOMNodeCollection = require('./dom_node_collection.js');

function $l(el){
  let matched;
  if (typeof el === 'string') {
    matched = document.querySelectorAll(el);
  }else if(el instanceof HTMLElement){
    matched = el;
  }
  let elements = Array.from(matched);
  return new DOMNodeCollection(elements);
}

window.$l = $l;