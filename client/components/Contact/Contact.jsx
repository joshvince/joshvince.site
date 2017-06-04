import React, { Component } from 'react';
import './styles.css';

class Contact extends Component {
  render() {
    return (
      <div className="row" id="contactContainer">
        <h1>Get in touch</h1>
        <a href="mailto:joshmvince@gmail.com">
          <h4>Email</h4>
        </a>
        <a href="https://github.com/joshvince">
          <h4>Github</h4>         
        </a>
      </div>
    );
  }
}

export default Contact;