 import Sidebar from './Composent/Sidebar';
import Menu from './Composent/Menu';
import './App.css';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import "bootstrap/dist/css/bootstrap.min.css";
import 'bootstrap-icons/font/bootstrap-icons.css';
import AjouterAcier from './Composent/AjouterAcier';
import {useState} from'react';
import User from './Composent/UserProfile';
function App() {

  return (
   
    <div>
      <div >
      <BrowserRouter>
     
      <Sidebar>
        <Routes>
          <Route path="/" element={<Menu />} />
          <Route path="/dashboard" element={ <Menu />} />
          <Route path="/product" element={<AjouterAcier />} />
          <Route path="/user" element={<User />} />
        </Routes>
      </Sidebar>
     
    </BrowserRouter>
      </div>
    
    </div>
  );
}

export default App;
