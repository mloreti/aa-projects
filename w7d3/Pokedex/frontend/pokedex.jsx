import React from 'react';
import ReactDOM from 'react-dom';


import {fetchAllPokemon} from './util/api_util';
import {receiveAllPokemon, requestAllPokemon} from './actions/pokemon_action';
import { selectAllPokemon } from './reducers/selectors';

import configureStore from './store/store';

import Root from './components/root';


document.addEventListener('DOMContentLoaded', () => {
    const store = configureStore();
    const rootEl = document.getElementById('root');
    ReactDOM.render(<Root store={store}/>, rootEl);

    window.store = store;
});
