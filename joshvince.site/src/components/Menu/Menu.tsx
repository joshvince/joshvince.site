import React, { FC } from "react";
import { Link } from "react-router-dom";
import "./styles.css";

const Menu: FC = () => {
  return (
    <div id="nav">
      <Link to="/" className="navItem" id="homeItem">
        Josh
      </Link>
      <Link to="/about" className="navItem">
        About
      </Link>
      <Link to="/projects" className="navItem">
        Projects
      </Link>
      <Link to="/contact" className="navItem">
        Contact
      </Link>
    </div>
  );
};

export default Menu;
