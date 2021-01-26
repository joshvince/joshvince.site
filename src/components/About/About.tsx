import React, { FC } from "react";
import { Link } from "react-router-dom";

const About: FC = () => {
  return (
    <div className="flex flex-col justify-start text-left">
      <h1 className="font-black text-7xl mb-10 text-left text-gray-800">Me.</h1>
      <div className="max-w-prose text-left">
        <p className="mb-6">
          I live on the south coast of the UK and work as a Product Manager at{" "}
          <a className="underline" href="https://zencargo.com">
            Zencargo
          </a>
          . I make things like software, music, films and food. I've done this
          with varying degrees of success (RIP{" "}
          <a
            className="underline"
            href="https://web.archive.org/web/20050210033700/http://www.mediamirror.co.uk:80/"
          >
            the flash cartoon site
          </a>{" "}
          we made as 15 year olds, deservedly lost to the annals of oblivion.)
        </p>
        <h2 className="font-black text-5xl text-left text-gray-800 mt-10 mb-8">Code.</h2>
        <p>
          I've been a Product Manager at early stage businesses for about five
          years. Twice now I've been the first PM as the team grew. I'm a
          hands-on PM and the thrill and terror of a start up motivates me. I
          love collaborating with engineers and designers to uncover the problem
          and test solutions as rapidly as possible.
        </p>
        <br />
        <p>
          After a few years as a PM, I made the slightly unusual decision to
          transition to become an engineer. I call myself a Product Engineer
          because that reflects the way I work: start with Product thinking, and
          find ways to engineer it.
        </p>
        <h2 className="font-black text-5xl text-left text-gray-800 mt-10 mb-8">Words.</h2>
        <p>
          Before I moved into product development I worked in the TV industry
          working with scriptwriters and, weirdly, on a spin-off of Eastenders.
          I directed a play at the Edinburgh Fringe Festival and somehow I've
          got a surreal{" "}
          <a className="underline" href="https://www.imdb.com/name/nm4531408/">
            IMDb
          </a>{" "}
          page that shows the lengths my friends and I would go to to avoid
          doing real work.
        </p>
        <h2 className="font-black text-5xl text-left text-gray-800 mt-10 mb-8">Music.</h2>
        <p>
          As a teenager, I played in a bunch of (criminally unsuccessful) bands
          and we were pretty sure there was an A&R man at a gig we played above
          a bar once. It was easy to tell because there were only 6 people there
          and we didn't recognise one of them. Nowadays, I play music just for
          myself. The world is largely unconcerned by this development.
        </p>
        <h2 className="font-black text-5xl text-left text-gray-800 mt-10 mb-8">And.</h2>
        <p>
          You've made it this far, so lets talk about the important stuff: I am
          passionate about history, especially Republican Rome. I also love
          football and have a season ticket at Brighton. As you might expect,
          these two interests rarely intersect. If they do for you too, let's chat.
        </p>
        <br />
        <p>
          <Link className="underline" to="/contact">
            Find my contact details here.
          </Link>{" "}
          No Crystal Palace fans or Carthaginians.
        </p>
      </div>
    </div>
  );
};

export default About;
