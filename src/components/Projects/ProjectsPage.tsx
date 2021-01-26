import { FC } from "react";
import ProjectSummary from "./ProjectSummary/ProjectSummary";

import type { Project } from "./types";

interface Props {
  projects: Project[];
}

const ProjectsPage: FC<Props> = ({ projects }) => {
  return (
    <div className="flex flex-col justify-start text-left">
      <h1 className="font-black text-7xl mb-10 text-left text-gray-800">Things.</h1>
      <p className="mb-12">Some things I've made or places I've worked.</p>
      {projects.map((project, i) => <ProjectSummary project={project} key={i} />)}
    </div>
  );
};

export default ProjectsPage;
