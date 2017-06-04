import React, { Component } from 'react';
import ProjectsPage from 'components/Projects/ProjectsPage.jsx';
import { CSSTransitionGroup } from 'react-transition-group'

import './styles.css';

import Menu from 'components/Home/Menu/Menu.jsx';
import projectList from 'assets/projects.json';

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
        <ProjectsPage projectList={projectList}/>
      </div>
    );
  }
}

export default Home;