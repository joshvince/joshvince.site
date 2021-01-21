import { FC } from "react";
import Paragraph from "./Paragraph";

import type { Project } from "../types";

interface Props {
  project: Project;
}

const ProjectOutline: FC<Props> = ({ project }) => {
  return (
    <div>
      <h2 className="text-gray-800 font-black text-7xl mb-6">
        {project.name}
      </h2>
      <p className="uppercase text-gray-500 mt-1">{project.dates}</p>
      {project.paragraphs.map((para, i) => {
        return <Paragraph para={para} key={i} />;
      })}
      <h3 className="text-gray-800 font-black text-4xl mb-4 mt-12">
        Check it out
      </h3>
      {project.links.map((link, i) => {
        return (
          <a href={link.url} className="underline" key={i}>
            <p className="leading-loose">{link.label}</p>
          </a>
        );
      })}
    </div>
  );
};

export default ProjectOutline;
