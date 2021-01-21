import { FC } from "react";

import contact from "../../assets/img/contact.png";

const Contact: FC = () => {
  return (
    <div className="flex flex-col justify-start text-left text-xl">
      <h1 className="font-black text-7xl mb-8 text-left text-gray-800">
        Contact.
      </h1>
      <div>Email me at joshmvince at gmail dot com</div>
      <br />
      <div>
        Check out my{" "} 
        <a href="https://github.com/joshvince">
          <span className="mb-1 underline">Github profile</span>
        </a>
      </div>
      <br />
      <div>
        And here is my{" "} 
        <a href="https://www.linkedin.com/in/joshvince/">
          <span className="mb-1 underline">LinkedIn</span>
        </a>
      </div>
      <div className="flex flex-col justify-start mb-12 mt-24">
        <img
          className="object-contain h-64 mb-2"
          src={contact}
          alt="Me, with existential dread"
        />
        <div className="text-sm text-gray-500 text-center">
          I don't usually look this miserable.
        </div>
      </div>
    </div>
  );
};

export default Contact;
