/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const Router = __webpack_require__(1)
const Inbox = __webpack_require__(2)
const Sent = __webpack_require__(4)
const Compose = __webpack_require__(3)

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


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const Inbox = __webpack_require__(2)
const Compose = __webpack_require__(3)
const Sent = __webpack_require__(4)

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

/***/ }),
/* 2 */
/***/ (function(module, exports) {

module.exports = {
  render () {
    let ul = document.createElement("ul");
    ul.className = "messages";
    ul.innerHTML = "An Inbox Message";
    return ul;
  }
}

/***/ }),
/* 3 */
/***/ (function(module, exports) {

throw new Error("Module parse failed: Unexpected token (8:2)\nYou may need an appropriate loader to handle this file type.\n|   }\n|   \n|   renderForm () {\n|     let header = document.createElement(\"p\");\n|     header.innerHTML = \"New Message\"");

/***/ }),
/* 4 */
/***/ (function(module, exports) {

module.exports = {
  render () {
    let ul = document.createElement("ul");
    ul.className = "messages";
    ul.innerHTML = "A Sent Message";
    return ul;
  }
}

/***/ })
/******/ ]);