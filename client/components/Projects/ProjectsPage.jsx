import React, { Component } from 'react';
import SummaryRow from './ProjectSummary/SummaryRow.jsx';
import './styles.css';

//FIXME: REMOVE THIS WHEN ROUTING IS SORTED
import ProjectOutline from './ProjectOutline/ProjectOutline.jsx';

class ProjectsPage extends Component {
  render() {
    function chunkArray(myArray, chunk_size){
      var results = [];
      while (myArray.length) {
        results.push(myArray.splice(0, chunk_size));
      }
      return results;
    }

    var rows = chunkArray(this.props.projects, 2)
    return (
      <div>
        <h1>Projects</h1>
        { rows.map((arr,i) => { return <SummaryRow projects={arr} key={i} /> }) }
        <ProjectOutline project={rows[0][0]} />
      </div>
      
    );
  }
}

export default ProjectsPage;