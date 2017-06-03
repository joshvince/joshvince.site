import React, { Component } from 'react';
import ProjectsPage from 'components/Projects/ProjectsPage.jsx';

import projectList from 'assets/projects.json';

class Home extends Component {
  render() {
    return (
      <div className="container">
        <h1>Josh Vince </h1>
        <ProjectsPage projectList={projectList}/>
      </div>
    );
  }
}

export default Home;