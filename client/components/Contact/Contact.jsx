import React, { Component } from 'react';
import './styles.css';

class Contact extends Component {
  render() {
    return (
      <div className="row" id="contactContainer">
        <h1>Get in touch</h1>
        
        <h4>Email joshmvince at gmail dot com</h4>
        <a href="https://github.com/joshvince">
          <h4>Github</h4>         
        </a>
        <a href="https://www.linkedin.com/in/joshvince/">
          <h4>Linkedin</h4>
        </a>
      </div>
    );
  }
}

export default Contact;