import { FC } from "react";
import { Link } from "react-router-dom";
import ProjectSummary from "../Projects/ProjectSummary/ProjectSummary";

import type { Project } from "../Projects/types";

interface Props {
  projects: Project[];
}

const Home: FC<Props> = ({ projects }) => {
  return (
    <div className="flex flex-col justify-start text-left">
      <h1 className="font-black text-7xl mb-10 text-left text-gray-800">
        Hello.
      </h1>
      <div>
        I make things. Learn more about me{" "}
        <Link to="/about" className="underline">
          here
        </Link>
        .
        <br />
        Check out some recent things I made below.
      </div>
      <div className="mt-12">
        {projects.map((project, i) => (
          <ProjectSummary project={project} key={i}/>
        ))}
      </div>
    </div>
  );
};

export default Home;
