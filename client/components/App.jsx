/* import dependencies */
import React, { Component } from 'react';
import {HashRouter as Router, Route, Link} from 'react-router-dom';
import 'milligram';

/* styles for this component */
import './styles.css';

/* import other components */
import Menu from 'components/Menu/Menu.jsx';
import ScrollToTop from 'components/Helpers/ScrollToTop.jsx';
import ProjectsPage from 'components/Projects/ProjectsPage.jsx';
import Home from 'components/Home/Home.jsx';
import About from 'components/About/About.jsx';
import ProjectOutline from 'components/Projects/ProjectOutline/ProjectOutline.jsx';

/* import the JSON containing the projects */
import projectList from 'assets/projects.json';

/* Dynamically import all images inside the assets folder and then store them in a var */
function importAll(r) {
  let images = {};
  r.keys().map((item, index) => { images[item.replace('./', '')] = r(item); });
  return images;
}

const imgLib = importAll(require.context('assets/img', false, /\.(png|jpe?g|svg)$/));

/* Dynamically render a Route, adding the project JSON as props to the component */
const renderProjectRoute = (project, i) => {
  return (
    <Route
      path={project.url}
      render={(props) => { return <ProjectOutline {...props} project={project} imgLib={imgLib} /> }}
      key={i}
    />
  )
}

class App extends Component {
  render() {
    console.log("rendered App component")
    return (
      <Router>
        <ScrollToTop>
          <div className="container">
            <Route component={Menu} />
            <div id="main">
              <Route exact path="/" component={Home} />
              <Route exact path="/about" component={About} />
              <Route exact path="/projects" component={ProjectsPage} />
              {/* render a route and project page for each project in the projectList*/}
              {projectList.map(renderProjectRoute)}
            </div>
          </div>
        </ScrollToTop>
      </Router>
    );
  }
}

export default App;