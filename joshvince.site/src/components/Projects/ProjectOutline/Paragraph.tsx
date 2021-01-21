import { FC } from "react";

import type { ProjectParagraph } from "../types";

interface Props {
  para: ProjectParagraph;
}

const Paragraph: FC<Props> = ({ para }) => {
  return (
    <div>
      <h3 className="font-black text-4xl text-left text-gray-800 mt-12 mb-6">{para.title}</h3>
      <p>{para.text}</p>
    </div>
  );
};

export default Paragraph;
