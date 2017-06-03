import React, { Component } from 'react';
import './styles.css';

class Paragraph extends Component {
  render() {
    return (
      <div className="row">
        <div className="column">
          <div className="paragraph">
            <div className="image">
              <img src={this.props.imgLib[this.props.para.image]} alt={this.props.projectName}/>
            </div>
            <h3>{this.props.para.title}</h3>
            <p>{this.props.para.text}</p>
          </div>                    
        </div>
      </div>
    );
  }
}

export default Paragraph;