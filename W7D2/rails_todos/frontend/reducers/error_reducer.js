import merge from 'lodash/merge';
import {
  RECEIVE_ERRORS, CLEAR_ERRORS, receiveErrors, clearErrors
} from '../actions/error_actions';

export const errorsReducer = (state = [], action) => {
  Object.freeze(state);
  const newState = {};
  switch(action.type){
    case RECEIVE_ERRORS:
      newState['errors'] = action.errors;
      return newState;
    case CLEAR_ERRORS:
      newState['errors'] = [];
      return newState;
    default:
      return state;
  }
};
