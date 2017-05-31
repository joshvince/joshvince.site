import React, { Component } from 'react';
import 'milligram';
import ProjectsPage from './Projects/ProjectsPage.jsx';

import ChoobioLogo from '../assets/img/choobio_logo.png';
import footballRumoursLogo from '../assets/img/football_rumours_logo.png';
import reactLogo from '../assets/img/logos/react.svg';
import jsLogo from '../assets/img/logos/js.png';

var longLorem = `Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. `
var shortLorem = `Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt.`

// FIXME: draw the projects data from somewhere that is not the top of this file!!!
var TEST_PROJECTS = [
  {
    name: "Choobio",
    summary: "A progressive web app that gives you live arrivals boards for London Underground stations.",
    image: ChoobioLogo,
    paragraphs: [
      {
        title: "A web app for live tube arrivals",
        image: ChoobioLogo,
        text: longLorem
      },
      {
        title: "React",
        image: reactLogo,
        text: longLorem
      },
      {
        title: "A Progressive Web App",
        image: jsLogo,
        text: longLorem
      },
    ]
  },
  {
    name: "Football Rumours",
    summary: "An Amazon Echo skill to tell you the latest football transfer stories about your team.",
    image: footballRumoursLogo
  },
  {
    name: "TRX",
    summary: shortLorem,
    image: ChoobioLogo
  }
]

class App extends Component {
  render() {
    return (
      <div className="container">
        <ProjectsPage projects={TEST_PROJECTS}/>
      </div>
    );
  }
}

export default App;