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

const FollowToggle = __webpack_require__(1);
const InfiniteTweets = __webpack_require__(4);
const TweetCompose = __webpack_require__(5);
const UsersSearch = __webpack_require__(3);

$(function () {
  $('div.infinite-tweets').each( (i, tweet) => new InfiniteTweets(tweet) );
  $('form.tweet-compose').each( (i, form) => new TweetCompose(form) );
  $('.users-search').each( (i, search) => new UsersSearch(search) );
  $('button.follow-toggle').each( (i, btn) => new FollowToggle(btn, {}) );
});


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.userId = this.$el.data('user-id') || options.userId;
    this.followState = (this.$el.data('initial-follow-state') ||
                        options.followState);
    this.render();

    this.$el.on('click', this.handleClick.bind(this));
  }

  handleClick(event) {
    const followToggle = this;

    event.preventDefault();

    if (this.followState === 'followed') {
      this.followState = 'unfollowing';
      this.render();
      APIUtil.unfollowUser(this.userId).then(() => {
        followToggle.followState = 'unfollowed';
        followToggle.render();
      });
    } else if (this.followState === 'unfollowed') {
      this.followState = 'following';
      this.render();
      APIUtil.followUser(this.userId).then(() => {
        followToggle.followState = 'followed';
        followToggle.render();
      });
    }
  }

  render() {
    switch (this.followState) {
      case 'followed':
        this.$el.prop('disabled', false);
        this.$el.html('Unfollow!');
        break;
      case 'unfollowed':
        this.$el.prop('disabled', false);
        this.$el.html('Follow!');
        break;
      case 'following':
        this.$el.prop('disabled', true);
        this.$el.html('Following...');
        break;
      case 'unfollowing':
        this.$el.prop('disabled', true);
        this.$el.html('Unfollowing...');
        break;
    }
  }
}

module.exports =  FollowToggle;


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const APIUtil = {

  followUser: id => APIUtil.changeFollowStatus(id, 'POST'),

  unfollowUser: id => APIUtil.changeFollowStatus(id, 'DELETE'),

  changeFollowStatus: (id, method) => (
    $.ajax({
      url: `/users/${id}/follow`,
      dataType: 'json',
      method
    })
  ),

  searchUsers: query => (
    $.ajax({
      url: '/users/search',
      dataType: 'json',
      method: 'GET',
      data: { query }
    })
  ),

  createTweet: data => (
    $.ajax({
      url: '/tweets',
      method: 'POST',
      dataType: 'json',
      data
    })
  ),

  fetchTweets: data => (
    $.ajax({
      url: '/feed',
      method: 'GET',
      dataType: 'json',
      data
    })
  )
};

module.exports = APIUtil;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

const FollowToggle = __webpack_require__(1);

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = this.$el.find('input[name=username]');
    this.$ul = this.$el.find('.users');

    this.$input.on('input', this.handleInput.bind(this));
  }

  handleInput(event) {
    if (this.$input.val() === '') {
      this.renderResults([]);
      return;
    }
    APIUtil.searchUsers(this.$input.val())
      .then(users => this.renderResults(users));
  }

  renderResults(users) {
    this.$ul.empty();

    for (let i = 0; i < users.length; i++) {
      const user = users[i];

      let $a = $('<a></a>');
      $a.text(`@${user.username}`);
      $a.attr('href', `/users/${user.id}`);

      const $followToggle = $('<button></button>');
      new FollowToggle($followToggle, {
        userId: user.id,
        followState: user.followed ? 'followed' : 'unfollowed'
      });

      const $li = $('<li></li>');
      $li.append($a);
      $li.append($followToggle);

      this.$ul.append($li);
    }
  }
}

module.exports = UsersSearch;


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

const _ = __webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module \"lodash\""); e.code = 'MODULE_NOT_FOUND'; throw e; }()));

class InfiniteTweets {
  constructor(el) {
    this.$el = $(el);
    this.lastCreatedAt = null;

    this.$el.on('click', '.fetch-more', this.fetchTweets.bind(this));
    this.$el.on('insert-tweet', this.insertTweet.bind(this));
  }

  fetchTweets(event) {
    event.preventDefault();

    const infiniteTweets = this;
    const data = {};
    if (this.lastCreatedAt) data.max_created_at = this.lastCreatedAt;

    APIUtil.fetchTweets(data).then((data) => {
      infiniteTweets.insertTweets(data);

      if (data.length < 20) {
        infiniteTweets.$el
          .find('.fetch-more')
          .replaceWith('<b>No more tweets!</b>');
      }

      if (data.length > 0) {
        infiniteTweets.lastCreatedAt = data[data.length - 1].created_at;
      }
    });
  }

  insertTweet(event, data) {
    this.$el.find('ul.tweets').prepend(this.tweetElement(data));

    if (!this.lastCreatedAt) {
      this.lastCreatedAt = data.created_at;
    }
  }

  insertTweets(data) {
    this.$el.find('ul.tweets').append(data.map(this.tweetElement));
  }

  tweetElement(tweet) {
    const mentions = tweet.mentions.map(mention =>
      `<li class='tweetee'>
        <a href='/users/${mention.user.id}'>@${mention.user.username}</a>
      </li>`)
      .join('');

    const elementString = `
    <div class='tweet'>
      <h3 class='tweeter'>
        <a href='/users/${tweet.user.id}'>
          @${tweet.user.username}
        </a>
      </h3>

      <p>${tweet.content}</p>

      <ul>Mentions
        ${mentions}
      </ul>
    </div>`;

    return $(elementString);
  }

}

module.exports = InfiniteTweets;


/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(2);

class TweetCompose {
  constructor(el) {
    this.$el = $(el);

    this.$input = this.$el.find('textarea[name=tweet\\[content\\]]');
    this.$input.on('input', this.handleInput.bind(this));

    this.$mentionedUsersDiv = this.$el.find('.mentioned-users');
    this.$el.find('.add-mentioned-user').on(
      'click', this.addMentionedUser.bind(this));
    this.$mentionedUsersDiv.on(
      'click', '.remove-mentioned-user', this.removeMentionedUser.bind(this));

    this.$el.on('submit', this.submit.bind(this));
  }

  addMentionedUser(event) {
    event.preventDefault();

    this.$mentionedUsersDiv.append(this.newUserSelect());
  }

  clearInput() {
    this.$input.val('');
    this.$mentionedUsersDiv.find('ul').empty();
    this.$el.find(':input').prop('disabled', false);
    this.$el.find('.char-left').empty();
  }

  handleInput(event) {
    const inputLength = this.$input.val().length;

    this.$el.find('.char-left').text(`${140 - inputLength} characters left`);
  }

  handleSuccess(data) {
    const $tweetsUl = $(this.$el.data('tweets-ul'));
    $tweetsUl.trigger('insert-tweet', data);

    this.clearInput();
  }

  newUserSelect() {
    const userOptions = window.users
      .map(user =>
        `<option value='${user.id}'>${user.username}</option>`)
      .join('');

    const html = `
      <div>
        <select name='tweet[mentioned_user_ids][]'>
          ${userOptions}
        </select>
        <button class='remove-mentioned-user'>Remove</button>
      </div>`;

    return $(html);
  }

  removeMentionedUser(event) {
    event.preventDefault();
    $(event.currentTarget).parent().remove();
  }

  submit(event) {
    event.preventDefault();
    const data = this.$el.serializeJSON();

    this.$el.find(':input').prop('disabled', true);

    APIUtil.createTweet(data).then(tweet => this.handleSuccess(tweet));
  }
}

module.exports = TweetCompose;


/***/ })
/******/ ]);
//# sourceMappingURL=bundle.js.map