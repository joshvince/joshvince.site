import React, { FC } from "react";
import SummaryRow from "./ProjectSummary/SummaryRow";

import image from "../../assets/img/projects.png";

import type { Project } from "./types";

import "./styles.css";

interface Props {
  projects: Project[];
}

const chunkArray = (propArray: any[], chunkSize: number): any[] => {
  var newArray = Array.from(propArray);
  var results = [];
  while (newArray.length) {
    results.push(newArray.splice(0, chunkSize));
  }
  return results;
};

const ProjectsPage: FC<Props> = ({ projects }) => {
  const rows = chunkArray(projects, 2);

  return (
    <div>
      <div className="column">
        <img src={image} id="headerImage" alt="my face" />
      </div>
      <h1>Projects</h1>
      <h4>Some places I worked and some things I made</h4>
      {rows.map((row, i) => (
        <SummaryRow projects={row} key={i} />
      ))}
    </div>
  );
};

export default ProjectsPage;
