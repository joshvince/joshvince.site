import React, { Component } from 'react';
import { CSSTransitionGroup } from 'react-transition-group';
import Menu from 'components/Menu/Menu.jsx';
import About from 'components/About/About.jsx';
import './styles.css';

class Home extends Component {
  render() {
    return (
      <div>
        <div className="headerContainer">
          <CSSTransitionGroup
            transitionName="pageTitle"
            transitionAppear={true}
            transitionAppearTimeout={500}
            transitionEnter={false}
            transitionLeave={false}>
            <header id="sectionHeader">Josh Vince </header>
          </CSSTransitionGroup>
          <CSSTransitionGroup
            transitionName="pageSubheader"
            transitionAppear={true}
            transitionAppearTimeout={1500}
            transitionEnter={false}
            transitionLeave={false}>
            <p>I like to <span className="highlight">make stuff</span></p> 
          </CSSTransitionGroup>
        </div>
        <About />
      </div>
    );
  }
}

export default Home;