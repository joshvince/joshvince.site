import React, { Component } from 'react';
import './styles.css';
import ProjectSummary from './ProjectSummary.jsx';

class SummaryRow extends Component {
  render() {
    return (
      <div className="row">
        {this.props.projects.map((proj,i,arr) => {
          return <ProjectSummary 
            project={proj}
            key={i}
            solo={arr.length == 1}
          />
        })}
      </div>
    );
  }
}

export default SummaryRow;