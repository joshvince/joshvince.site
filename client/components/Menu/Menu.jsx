import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import './styles.css';

class Menu extends Component {
  render() {
    return (
      <div id="nav">
          <Link to="/" className="navItem">About</Link>
          <Link to="/projects" className="navItem">Projects</Link>
          <Link to="/contact" className="navItem">Contact</Link>
      </div>
    );
  }
}

export default Menu;