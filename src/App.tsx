import React, { FC, ReactNode } from "react";
import { HashRouter as Router, Route } from "react-router-dom";

import Sidebar from "./components/Sidebar/Sidebar";
import MobileMenu from "./components/MobileMenu/MobileMenu";
import ScrollToTop from "./components/Helpers/ScrollToTop";
import ProjectsPage from "./components/Projects/ProjectsPage";
import Home from "./components/Home/Home";
import About from "./components/About/About";
import Blog from "./components/Blog/Blog";
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

const highlightProjects = () => {
  return projectList.filter(project => project.highlight) 
};

const App: FC = () => {
  return (
    <Router>
      <div className="container mx-auto max-w-5xl md:pt-12 pb-12 flex flex-col md:flex-row font-body bg-gray-50 text-gray-600 font-light text-lg">
        <ScrollToTop />
        <Route component={Sidebar} />
        <Route component={MobileMenu} />
        <div className="px-6 md:px-12 mt-24 md:mt-0 md:w-9/12 md:ml-64">
          <Route
            exact
            path="/"
            render={() => <Home projects={highlightProjects()} />}
          />
          <Route exact path="/about" render={() => <About />} />
          <Route exact path="/blog" render={() => <Blog />} />
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
