import React, { FC } from "react";
import Paragraph from "./Paragraph";
import "./styles.css";

import type { Project } from "../types";

interface Props {
  project: Project;
}

const ProjectOutline: FC<Props> = ({ project }) => {
  return (
    <div>
      <div className="row">
        <div className="column">
          <h1>{project.name}</h1>
        </div>
      </div>
      {project.paragraphs.map((para, i) => {
        return <Paragraph para={para} key={i} />;
      })}
      <h3>Check it out</h3>
      <div className="row">
        {project.links.map((link, i) => {
          return (
            <div className="column" key={i}>
              <a href={link.url}>
                <h4>{link.label}</h4>
              </a>
            </div>
          );
        })}
      </div>
    </div>
  );
};

export default ProjectOutline;
