import React, { Component } from 'react';
import './styles.css';

class ProjectSummary extends Component {
  render() {
    var classes = this.props.solo ? "column solo card" : "column card"
    return (
      <div className={classes}>
        <div className="iconsCol">
          <div className="icon">
            <img src={this.props.image} alt={this.props.name}/>
          </div>
        </div>
        <div className="textCol">
          <h2 className="title">{this.props.name}</h2>
          <p className="summary">{this.props.summary}</p>
        </div>
      </div>
    );
  }
}

export default ProjectSummary;