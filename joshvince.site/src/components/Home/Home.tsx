import { FC } from "react";
import { Link } from "react-router-dom";

const Home: FC = () => {
  return (
    <div className="flex flex-col justify-start text-left">
      <h1 className="font-black text-7xl mb-8 text-left text-gray-800">Hello.</h1>
      <div>
        I make things. Learn more about me{" "}
        <Link to="/about" className="underline">
          here
        </Link>
        .
        <br />
        Check out some recent things I made below. 
      </div>
    </div>
  );
};

export default Home;
