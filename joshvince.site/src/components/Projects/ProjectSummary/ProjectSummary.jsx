import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import './styles.css';

class ProjectSummary extends Component {
  render() {
    var classes = this.props.solo ? "column solo card" : "column card"
    return (
      <div className={classes}>
          <div className="textCol">
            <Link to={this.props.project.url}>
              <h2 className="title">{this.props.project.name}</h2>
            </Link>
            <p className="subheader">{this.props.project.dates}</p>
            <p className="summary">{this.props.project.summary}</p>
          </div>
      </div>
    );
  }
}

export default ProjectSummary;