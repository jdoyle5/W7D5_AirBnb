import { combineReducers } from 'redux';
import { entitiesReducer } from './entities_reducer';
import { uiReducer } from './ui_reducer';

export const rootReducer = combineReducers({
  entities: entitiesReducer,
  ui: uiReducer
});
