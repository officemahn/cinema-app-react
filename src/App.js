import React from 'react';
import { Provider } from 'react-redux';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

import './App.scss';
import Header from './components/header/Header';
import store from './redux/store';
import Main from './components/main/Main';
import Details from './components/content/details/Details';

const App = () => {
  return (
    <Provider store={store}>
      <Router>
        <Header />
        <div className="app">
          <Routes>
            <Route exact path="/" element={<Main />} />
            <Route exact path="/:id/:name/details" element={<Details />} />
          </Routes>
        </div>
      </Router>
    </Provider>
  );
};

export default App;
