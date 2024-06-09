/**
 * @Author: Ramiro Luiz Nunes
 * @Date:   2024-06-06 19:58:10
 * @Last Modified by:   Ramiro Luiz Nunes
 * @Last Modified time: 2024-06-09 13:33:05
 */

import React from 'react';
import ReactDOM from 'react-dom/client';
import './resources/css/index.css';
import App from './pages/App';
import reportWebVitals from './reportWebVitals';

const root = ReactDOM.createRoot(
  document.getElementById('root') as HTMLElement
);
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
