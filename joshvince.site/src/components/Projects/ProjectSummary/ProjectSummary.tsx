import React, { FC } from "react";
import { Link } from "react-router-dom";

import type { Project } from "../types";

interface Props {
  project: Project;
}

const ProjectSummary: FC<Props> = ({ project }) => {
  return (
    <div className="mb-20">
      <Link to={project.url}><h2 className="text-gray-800 font-black text-4xl hover:underline">{project.name}</h2></Link>
      <p className="uppercase text-gray-500 mt-1">{project.dates}</p>
      <p className="mt-2">{project.summary}</p>
    </div>
  );
};

export default ProjectSummary;
