import React, { FC } from "react";
import "./styles.css";

import type { ProjectParagraph } from "../types";

interface Props {
  para: ProjectParagraph;
}

const Paragraph: FC<Props> = ({ para }) => {
  return (
    <div className="row">
      <div className="column">
        <div className="paragraph">
          <h3>{para.title}</h3>
          <p>{para.text}</p>
        </div>
      </div>
    </div>
  );
};

export default Paragraph;
