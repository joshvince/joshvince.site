import React, { Component } from 'react';
import SummaryRow from './ProjectSummary/SummaryRow.jsx';

import './styles.css';

/* import the JSON containing the project details */
import projectList from 'assets/projects.json';

class ProjectsPage extends Component {
  chunkArray(propArray, chunkSize){
    var newArray = Array.from(propArray);
    var results = [];
    while (newArray.length) {
      results.push(newArray.splice(0, chunkSize));
    }
    return results;
  }
  render() {
    var rows = this.chunkArray(projectList, 2)
    return (
      <div>
        <h1>Projects</h1>
        <h4 className="subheader">Some things I made</h4>
        { rows.map((arr,i) => { return <SummaryRow projects={arr} key={i} /> }) }
      </div>
    );
  }
}

export default ProjectsPage;