import React, { Component } from 'react';
import './styles.css';

class Contact extends Component {
  render() {
    return (
      <div className="row" id="contactContainer">
        <h1>Get in touch</h1>
        <a>
          <h4>Email me at joshmvince at gmail dot com</h4>
        </a>
        <a href="https://github.com/joshvince">
          <h4>View my Github</h4>         
        </a>
      </div>
    );
  }
}

export default Contact;