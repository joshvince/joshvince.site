export interface Project {
  name: string;
  url: string;
  summary: string;
  dates: string;
  image?: string;
  paragraphs:  ProjectParagraph[];
  links: LinkObject[];
  highlight?: boolean;
}

export interface ProjectParagraph {
  title: string;
  image: string | null;
  text: string;
}

interface LinkObject {
  label: string;
  url: string;
}
