import React, { FC } from "react";
import { Link } from "react-router-dom";
import "./styles.css";

const Home: FC = () => {
  return (
    <div id="homepageContainer">
      <div className="headerContainer">
        <header id="sectionHeader">JOSH VINCE </header>
        <p>
          I like to <span className="highlight">make stuff</span>
        </p>
      </div>
      <div className="row">
        <div className="column">
          <h1>About me</h1>
          <div className="paragraph">
            <p>
              I live on the south coast of the UK and work as a{" "}
              <span className="highlight"> Product Manager </span>
              at <a href="https://www.zencargo.com">Zencargo</a> making stuff,
              big and small, every day.
              <br />
              <br />
              You can see examples of things I've made over at the{" "}
              <Link to="/projects"> projects page </Link>
              or you can learn more about me at the appropriately titled{" "}
              <Link to="/about"> about page</Link>.
            </p>
          </div>
          <br />
          <br />
          <br />
        </div>
      </div>
    </div>
  );
};

export default Home;
