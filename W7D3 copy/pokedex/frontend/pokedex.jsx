import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore } from './store/store';
import { Root } from './components/root';
import { HashRouter, Route } from 'react-router-dom';

import { receiveAllPokemon, requestAllPokemon, requestOnePokemon } from './actions/pokemon_actions';
import { fetchAllPokemon } from './util/api_util';
import { selectAllPokemon } from './reducers/selectors';

document.addEventListener('DOMContentLoaded', () => {
  window.requestAllPokemon = requestAllPokemon;
  window.requestOnePokemon = requestOnePokemon;
  window.selectAllPokemon = selectAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.fetchAllPokemon = fetchAllPokemon;
  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  ReactDOM.render(<Root store={store}/>, document.getElementById('root'));
});
