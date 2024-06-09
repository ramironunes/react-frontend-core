/**
 * @Author: Ramiro Luiz Nunes
 * @Date:   2024-06-06 20:01:10
 * @Last Modified by:   Ramiro Luiz Nunes
 * @Last Modified time: 2024-06-09 13:36:00
 */

import React from 'react';
import logo from '../assets/img/logo.svg';
import '../assets/css/app.css';

function App() {
  return (
    <div className="app">
      <header className="app-header">
        <img src={logo} className="app-logo" alt="logo" />
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
        </p>
        <a
          className="app-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
