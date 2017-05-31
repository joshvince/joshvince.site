import React, { Component } from 'react';
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
        {this.props.project.paragraphs.map((para, i) => {
          return <div className="row" key={i}>
                  <div className="column">
                    <div className="paragraph">
                      <div className="image">
                        <img src={para.image} alt={this.props.project.name}/>
                      </div>
                      <h2>{para.title}</h2>
                      <p>{para.text}</p>
                    </div>                    
                  </div>
                </div>
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