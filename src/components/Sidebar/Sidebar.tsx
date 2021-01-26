import { FC } from "react";
import { Link } from "react-router-dom";

const Sidebar: FC = () => {
  return (
    <div className="hidden md:flex flex-col object-top fixed w-64 max-w-sm ml-12">
      <Link to="/" className="text-8xl font-black text-gray-800 pb-8">
        <div>JO</div>
        <div>SH</div>
      </Link>
      <div className="text-gray-900 mb-2">Josh Vince</div>
      <Link to="/about">
        <div className="mb-1 hover:underline">About</div>
      </Link>
      <Link to="/blog">
        <div className="mb-1 hover:underline">Blog</div>
      </Link>
      <Link to="/projects">
        <div className="mb-1 hover:underline">Things</div>
      </Link>
      <Link to="/contact">
        <div className="mb-1 hover:underline">Contact</div>
      </Link>
      <a href="https://github.com/joshvince" target="_blank" rel="noreferrer">
        <div className="mb-1 hover:underline">Github</div>
      </a>
      <a
        href="https://www.linkedin.com/in/joshvince/"
        target="_blank"
        rel="noreferrer"
      >
        <div className="mb-1 hover:underline">LinkedIn</div>
      </a>
    </div>
  );
};

export default Sidebar;
