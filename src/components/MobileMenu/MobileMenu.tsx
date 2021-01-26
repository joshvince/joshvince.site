import { FC, useState, useEffect } from "react";
import { Link } from "react-router-dom";

const MobileMenu: FC = () => {
  const [isOpen, setisOpen] = useState(false);
  const [position, setPosition] = useState(0);

  const handleScroll = () => {
    const position = window.pageYOffset;
    setPosition(position);
  };

  useEffect(() => {
    window.addEventListener('scroll', handleScroll, { passive: true });
    return () => {
      window.removeEventListener('scroll', handleScroll);
    }
  }, []);

  const shadowClass = (position > 0) ? "shadow-lg" : ""

  return (
    <div
      className={`md:hidden flex flex-col object-top fixed w-full bg-gray-50 pt-6 ${shadowClass}`}
      onClick={(_e) => setisOpen(!isOpen)}
    >
      <div className="h-16 px-12 cursor-pointer">
        <div className="text-3xl font-black text-gray-800 ">JOSH</div>
      </div>
      {isOpen && (
        <div className="pb-4 flex flex-col shadow-lg px-12">
          <Link to="/">
            <div className="mb-1 hover:underline">Home</div>
          </Link>
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
          <a
            href="https://github.com/joshvince"
            target="_blank"
            rel="noreferrer"
          >
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
      )}
    </div>
  );
};

export default MobileMenu;
