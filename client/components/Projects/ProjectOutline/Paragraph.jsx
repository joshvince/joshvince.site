import React, { Component } from 'react';
import './styles.css';

class Paragraph extends Component {
  render() {
    var imgSrc = this.props.imgLib[this.props.para.image] || null
    var img = imgSrc ? <img src={imgSrc} alt={this.props.projectName}/> : null
    return (
      <div className="row">
        <div className="column">
          <div className="paragraph">
            <div className="image">
              {img}
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