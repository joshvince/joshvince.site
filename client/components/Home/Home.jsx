import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import { CSSTransitionGroup } from 'react-transition-group';
import Menu from 'components/Menu/Menu.jsx';
import About from 'components/About/About.jsx';
import './styles.css';

class Home extends Component {
  render() {
    return (
      <div id="homepageContainer">
        <div className="headerContainer">
          <CSSTransitionGroup
            transitionName="pageTitle"
            transitionAppear={true}
            transitionAppearTimeout={500}
            transitionEnter={false}
            transitionLeave={false}>
            <header id="sectionHeader">JOSH VINCE </header>
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
        <div className="row">
          <div className="column">
            <h1>About me</h1>
            <div className="paragraph">
              <p>
                I live on the south coast of the UK and work as a <span className="highlight"> Product Manager </span> 
                at <a href="https://www.zencargo.com">Zencargo</a> making stuff, big and small, every day.<br/><br/>

                You can see examples of things I've made over at the <Link to="/projects"> projects page </Link>
                or you can learn more about me at the appropriately titled <Link to="/about"> about page</Link>.
              </p>
            </div>
            <br/><br/><br/>
          </div>  
        </div>
      </div>
    );
  }
}

export default Home;