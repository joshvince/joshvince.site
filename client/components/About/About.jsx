import React, { Component } from 'react';
import { Link } from 'react-router-dom';
import './styles.css';

class About extends Component {
  render() {
    return (
      <div>
        <div className="row">
          <div className="column">
            <h1>About me</h1>
            <div className="paragraph">
              <p>
                In the last couple of years, I've taught myself to make things with code.<br/><br/>
                
                I currently live in London and work as a <span className="highlight"> Product Manager </span> 
                at <a href="trx.tv">trx.tv</a> which is brilliant because I get to make stuff, big and small, 
                every day.<br/><br/>

                I know all this page proves is that I know the hexcode for an awesome blue background, 
                so you can see examples of things I've made over at the <Link to="/projects"> projects page </Link>.
              </p>
            </div>

            <h3>Making things with code</h3>
            <div className="paragraph">
              <p>
                My first language was <span className="highlight">Elixir</span>, a
                <span className="highlight"> Functional Programming </span> language. I learnt Elixir on the 
                guidance of my CTO, who helped give me an education in pure functions and immutable data.<br/><br/>

                I enjoy working with <span className="highlight">Javascript</span>, because for all its flaws
                you'd be foolish to tackle the web without embracing it. My favourite framework is 
                <span className="highlight"> React</span> because I love the component-led style of building UI.<br/><br/>

                Recently I've started looking to the future of the web, exploring concepts like 
                <span className="highlight"> Progressive Web Apps and AR. </span>
              </p>

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
                  about how, as a teenager, I was legitimately once in a band called "The Defects" and how I am pretty 
                  sure there was an A&R man at a gig I played above a bar once.<br/><br/>
                  
                  I am also keenly interested in <span className="highlight"> history </span> both ancient and modern, 
                  and I love football, especially the mighty <span className="highlight"> Brighton. </span>
                </p>
              </div>
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