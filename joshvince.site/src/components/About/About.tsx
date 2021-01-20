import React, { FC } from "react";
import { Link } from "react-router-dom";

import about from "../../assets/img/about.png";

const About: FC = () => {
  return (
    <div>
      <div className="row">
        <div className="column">
          <img src={about} id="headerImage" alt="My face"/>
          <h1>About me</h1>
          <div className="paragraph">
            <p>
              I love to make all kinds of things. Mostly I make software, music,
              films and food. I've done this since I was very young with varying
              degrees of success (RIP the flash cartoon site we made as 15 year
              olds, deservedly lost to the annals of oblivion.)
            </p>
          </div>

          <h3>Making things with code</h3>
          <div className="paragraph">
            <p>
              I work as a <span className="highlight">Product Manager</span> at
              Zencargo, as part of a team making an ambitious piece of software
              that helps global supply chains.
            </p>
            <p>
              In 2016 I fell into product development and, with the help of{" "}
              <a href="https://twitter.com/cameronp">Cameron Price</a> I learned
              to code. Since then I've loved making software both in my job as a
              Product Manager and directly on the side.
            </p>
            <p>
              I learned to code via <span className="highlight">Elixir </span>{" "}
              and <span className="highlight">Functional Programming</span>.
              Throughout my career I've mostly worked{" "}
              <span className="highlight">Ruby </span> and I'm particularly fond
              of <span className="highlight"> React</span> in the frontend,
              especially as it allows me to flex those FP muscles.
            </p>
          </div>

          <h3>Making things with words</h3>
          <div className="paragraph">
            <p>
              Before I moved into product development I worked in the TV
              industry working with
              <span className="highlight"> scriptwriters</span> and, weirdly, on
              a spin-off of Eastenders. I directed a play at the Edinburgh
              Fringe Festival and somehow I've got a surreal{" "}
              <a href="https://www.imdb.com/name/nm4531408/">IMDB page</a> that
              shows the lengths my friends and I would go to to avoid doing real
              work.
              <br />
              <br />
              Working with writing and writers has given me a good understanding
              of how to{" "}
              <span className="highlight">communicate effectively. </span> I am
              also a firm believer in the idea that narrative is the primary way
              we see the world and ourselves within it, which is a mindset I
              apply to my work in
              <span className="highlight"> UX and Interaction Design. </span>
            </p>
          </div>

          <h3>Everything else</h3>
          <div className="paragraph">
            <p>
              One of my biggest passions is{" "}
              <span className="highlight"> music</span>. If we meet I can tell
              you about how, as a teenager, I played in a bunch of (criminally
              unsuccessful) bands and we were pretty sure there was an A&R man
              at a gig we played above a bar once.
              <br />
              <br />I am also keenly interested in{" "}
              <span className="highlight"> history </span> both ancient and
              modern, and I love football, especially the mighty{" "}
              <span className="highlight"> Brighton. </span>
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
};

export default About;
