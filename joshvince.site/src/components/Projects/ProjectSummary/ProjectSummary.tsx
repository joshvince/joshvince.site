import React, { FC } from "react";
import { Link } from "react-router-dom";
import "./styles.css";

import type { Project } from "../types";

interface Props {
  project: Project;
  solo: boolean;
}

const ProjectSummary: FC<Props> = ({ project, solo }) => {
  const classes = solo ? "column solo card" : "column card";
  return (
    <div className={classes}>
      <div className="textCol">
        <Link to={project.url}>
          <h2 className="title">{project.name}</h2>
        </Link>
        <p className="subheader">{project.dates}</p>
        <p className="summary">{project.summary}</p>
      </div>
    </div>
  );
};

export default ProjectSummary;
