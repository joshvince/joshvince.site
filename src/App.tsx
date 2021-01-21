import React, { FC, ReactNode } from "react";
import { HashRouter as Router, Route } from "react-router-dom";

import Sidebar from "./components/Sidebar/Sidebar";
import ScrollToTop from "./components/Helpers/ScrollToTop";
import ProjectsPage from "./components/Projects/ProjectsPage";
import Home from "./components/Home/Home";
import About from "./components/About/About";
import Contact from "./components/Contact/Contact";
import ProjectOutline from "./components/Projects/ProjectOutline/ProjectOutline";

import projectList from "./assets/projects.json";

import type { Project } from "./components/Projects/types";

/* Dynamically render a Route for each project, adding the project JSON as props to the component */
const renderProjectRoute = (project: Project, i: number): ReactNode => {
  return (
    <Route
      path={project.url}
      render={(props) => {
        return <ProjectOutline {...props} project={project} />;
      }}
      key={i}
    />
  );
};

const App: FC = () => {
  return (
    <Router>
      <div className="container mx-auto max-w-5xl py-12 px-6 flex font-body bg-gray-50 text-gray-600 font-light text-lg">
        <ScrollToTop />
        <Route component={Sidebar} />
        <div className="px-6 w-9/12 ml-64">
          <Route exact path="/" component={Home} />
          <Route exact path="/about" render={() => <About />} />
          <Route exact path="/contact" render={() => <Contact />} />
          <Route
            exact
            path="/projects"
            render={() => <ProjectsPage projects={projectList} />}
          />
          {projectList.map(renderProjectRoute)}
        </div>
      </div>
    </Router>
  );
};

export default App;
