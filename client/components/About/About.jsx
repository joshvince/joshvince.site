import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class About extends Component {
  constructor(props){
    super(props)
  }
  render() {
    let imgSrc = this.props.imgLib['about.png'];
    return (
      <div>

        <div className="row">
          <div className="column">
            <img src={imgSrc} id="headerImage"/>
            <h1>About me</h1>
            <div className="paragraph">
              <p>
                I love to make all kinds of things: scripts, songs, films, plays,
                and when I was 15 some friends and I made a flash cartoon site which
                has since deservedly been lost to the annals of internet oblivion.
              </p>
            </div>

            <h3>Making things with code</h3>
            <div className="paragraph">
              <p>
                I work as a <span className="highlight">Product Manager</span> at Zencargo,
                I joined in March 2018 and am really pleased to be starting a new exciting challenge.
              </p>
              <p>
                Over the last couple of years I've also taught myself to code.
                I enjoy working with <span className="highlight">Javascript</span>, both in the browser and
                on the server with <span className="highlight">Node.js</span>. My favourite framework is
                <span className="highlight"> React</span> because I love the component-led style of building UI.
              </p>
              <p>
                I also really enjoy working in <span className="highlight">Elixir</span>,
                a <span className="highlight"> Functional Programming </span> language, and I've also
                started looking to the future of the web, exploring concepts like
                <span className="highlight"> Progressive Web Apps and AR. </span>
              </p>
            </div>

            <h3>Making things with words</h3>
            <div className="paragraph">
              <p>
                After university, before I moved into technology I worked in the TV industry, working in
                <span className="highlight"> scriptwriting</span>. I've also written and directed a few
                short films and a play that ran at the Edinburgh Fringe.<br/><br/>

                Working with writing and writers has given me a good understanding of how to <span className="highlight">
                communicate effectively. </span> I am also a firm believer in the idea that narrative is the
                primary way we see the world and ourselves within it, which is a mindset I apply to my work in
                <span className="highlight"> UX and Interaction Design. </span>
              </p>
            </div>

            <h3>Everything else</h3>
            <div className="paragraph">
              <p>
                One of my biggest passions is <span className="highlight"> music</span>. If we meet I can tell you
                about how, as a teenager, I played in a bunch of (criminally unsuccessful) bands and we were pretty
                sure there was an A&R man at a gig we played above a bar once.<br/><br/>

                I am also keenly interested in <span className="highlight"> history </span> both ancient and modern,
                and I love football, especially the mighty <span className="highlight"> Brighton. </span>
              </p>
            </div>

          </div>
        </div>

        <div className="row">
          <div className="column">
            <Link to="/projects">
              <h4>See my projects</h4>
            </Link>
          </div>
          <div className="column">
            <Link to="/contact">
              <h4>Contact me</h4>
            </Link>
          </div>
        </div>

      </div>
    );
  }
}

export default About;