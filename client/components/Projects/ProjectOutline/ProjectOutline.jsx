import React, { Component } from 'react';
import { Link } from 'react-router-dom';
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
        <h3>Check it out</h3>
        <div className="row">
          {this.props.project.links.map((link, i) => {
            return (
              <div className="column" key={i}>
                <a href={link.url}>
                  <h4>{link.label}</h4>
                </a>
              </div>
            );
          })}
        </div>
      </div>
    );
  }
}

export default ProjectOutline;