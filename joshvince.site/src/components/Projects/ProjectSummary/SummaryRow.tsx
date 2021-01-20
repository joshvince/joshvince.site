import React, { FC } from "react";
import "./styles.css";
import ProjectSummary from "./ProjectSummary";

import type { Project } from "../types";

interface Props {
  projects: Project[];
}

const SummaryRow: FC<Props> = ({ projects }) => {
  return (
    <div className="row">
      {projects.map((proj, i, arr) => {
        const isSoloRow = arr.length === 1;
        return <ProjectSummary project={proj} key={i} solo={isSoloRow} />;
      })}
    </div>
  );
};

export default SummaryRow;
