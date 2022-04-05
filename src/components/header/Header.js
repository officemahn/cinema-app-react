/* eslint-disable arrow-body-style */
import React, {useState} from 'react';
import logo from '../../logo.svg';
import './Header.scss';

Header = function() {
  let [navClass, setNavClass] = useState(false);
  let [menuClass, setMenuClass] = useState(false);

  toggleMenu = function() {
    menuClass = !menuClass,
    navClass  = !navClass,
    setNavClass(navClass);
    setMenuClass(menuClass);
  };
  return (
    <>
      <div className="header-nav-wrapper">
        <div className="header-bar"></div>
        <div className="header-navbar">
          <div className="header-image">
            {/* <img src={logo} alt="" /> */}
            Cinema App
          </div>
          <div 
            className={`${menuClass ? 'header-menu-toggle is-active' : 'header-menu-toggle'}`} 
            id ="header-mobile-menu"
            onClick={() => toggleMenu()}
          >
            <span className="bar"></span>
            <span className="bar"></span>
            <span className="bar"></span>
          </div>
          <ul className={`${navClass ? 'header-nav header-mobile-nav' : 'header-nav'}`}>
            <li className="header-nav-item"> Now Playing</li>
            <li className="header-nav-item"> New Movies</li>
            <input type="text" className="search-input" placeholder="Search for a movie" />
          </ul>
        </div>

      </div>
    </>
  );
};

export default Header;
