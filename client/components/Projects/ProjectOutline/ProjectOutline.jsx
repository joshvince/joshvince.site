import React, { Component } from 'react';
import Paragraph from 'components/Projects/ProjectOutline/Paragraph.jsx';
import './styles.css';

class ProjectOutline extends Component {
  render() {
    return (
      <div>
        <div className="row">
          <div className="column">
            <h1>{this.props.project.name}</h1>
          </div>
        </div>
        {/* render the paragraphs */}
        {this.props.project.paragraphs.map((para, i) => {
          return (
            <Paragraph 
              para={para} 
              projectName={this.props.project.name} 
              imgLib={this.props.imgLib}
              key={i} 
            />
          );
        })}
        <div className="row">
          <div className="button-wrapper">
            <button className="button button-large">Check it out</button>
          </div>
        </div>
      </div>
    );
  }
}

export default ProjectOutline;