/* eslint-disable import/no-named-as-default */
import React from 'react';
import { Provider } from 'react-redux';

import './App.scss';
import store from './redux/store';

const App = () => (
  <Provider store={store}>
    <div className="app">
      <h1> REACT REDUX SETUP</h1>
    </div>
  </Provider>
);

export default App;
