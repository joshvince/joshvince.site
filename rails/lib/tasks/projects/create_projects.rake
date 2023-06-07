namespace :projects do
  desc 'Create projects'
  task :create => :environment do |_args|
    carwow = {
      slug: "carwow",
      name: "Carwow",
      job: true,
      subtitle: "worked here from 2022 to now",
      tagline: "The easy way to change cars online",
      description: [
        {
          heading: "Bigger and better",
          text: "Carwow is the biggest company I've worked for and they operate at a scale I've not experienced yet, with millions of users a month. I'm enjoying learning about B2C stuff."
        },
        {
          heading: "Rails",
          text: "I started my career working in Rails and it's nice to go back. I really enjoy Ruby and I love The Rails Way. Carwow make very intelligent and pragmatic choices when it comes to their technology."
        }
      ].to_json,
      link_1_name: "View the site",
      link_1: "https://carwow.co.uk"
    }

    zencargo = {
      slug: "zencargo",
      name: "Zencargo",
      job: true,
      subtitle: "worked here from 2018 to 2022",
      tagline: "Supply chain optimisation for modern businesses",
      description: [
        {
          heading: "Scaling a business",
          text: "I started at Zencargo in March 2018 as the first Product Manager in a company of ten people. By the time I left, the business had grown to over 300 people with a software team of 55."
        },
        {
          heading: "Solving real world problems",
          text: "Zencargo move goods around the world for some of the fastest growing companies in retail. My work helped customers get the right product to the right place for the right cost."
        },
        {
          heading: "Making an impact",
          text: "Throughout my time at Zencargo I took active roles in hiring, setting up our process and leading squads to make sure that we did great work, and had fun while we're at it."
        }
      ].to_json,
      link_1_name: "View the site",
      link_1: "https://zencargo.com"
    }

    howmanymeetings = {
      slug: "howmanymeetingswereyouin",
      name: "2020 in meetings",
      job: false,
      subtitle: "side project in 2021",
      tagline: "Analyse how much time you spent in meetings in 2020",
      description: [
        {
          heading: "Analysing meetings",
          text: "This site takes in your calendar data and tells you the percentage of time you spent in meetings, as well as how the pandemic affected your meeting habits."
        },
        {
          heading: "Integrating with Google",
          text: "To get the data, we use the Google Calendar API. I integrate through the browser client and handle oAuth correctly."
        },
        {
          heading: "A Rails backend",
          text: "The actual analysis is served by a rails backend hosted on Heroku. I was able to spin up the entire backend in a couple of days using Rails. The frontend is in React."
        }
      ].to_json,
      link_1_name: "This is a private project I worked on with a friend, but get in touch if you want to know more",
      link_1: "/contact"
    }

    wedding = {
      slug: "wedding-site",
      name: "Wedding site",
      job: false,
      subtitle: "side project in 2019",
      tagline: "The guest list and invitations for my wedding",
      description: [
        {
          heading: "A paperless wedding",
          text: "We didn't want to send out traditional paper invitations, so I made an RSVP system for all our guests. Talk about a big bang release."
        },
        {
          heading: "Phoenix API backend",
          text: "I used a Phoenix app to handle the logic around RSVPs and invitations. It serves the frontend via a JSON API. I really enjoy Phoenix as a framework, especially for serving APIs."
        },
        {
          heading: "React and Tailwind",
          text: "It was really important that I got this right first time, and I enjoyed using functional react (combined with tailwind.css) to handle richer user interactions."
        }
      ].to_json,
      link_1_name: "Repo",
      link_1: "https://github.com/joshvince/weddingsite",
      link_2_name: "Site (but the login won't work)",
      link_2: "http://boshwedding.com.s3-website-eu-west-1.amazonaws.com/"
    }

    bowie = {
      slug: "bowie-ipsum",
      name: "Bowie Ipsum",
      job: false,
      subtitle: "side project in 2018",
      tagline: "David Bowie themed lorem ipsum",
      description: [
        {
          heading: "Better Lorem Ipsum",
          text: "I created this simple site so designers could use David Bowie themed Lorem Ipsum in designs. Select an era and generate random lyrics to fill the blanks."
        },
        {
          heading: "Leveraging modern CSS",
          text: "This was my first experiment with CSS grid combined with flexbox. It was also my first real look at transitions and how to add finishing touches with CSS."
        },
        {
          heading: "React Context API",
          text: "I worked on this as React released the Context API, updating the theme based on the user's choice seemed a good use case."
        }
      ].to_json,
      link_1_name: "View the site",
      link_1: "https://joshvince.github.io/bowie-ipsum/"
    }

    choobio = {
      slug: "choobio",
      name: "Choobio",
      job: false,
      subtitle: "side project in 2018",
      tagline: "Progressive Web App showing live arrivals boards for the Tube",
      description: [
        {
          heading: "A web app for live tube arrivals",
          text: "Unlike the physical boards on the platform, Choobio gives you arrivals far ahead of the next few minutes and it also helps you find a quiet train by calculating the interval between two tube trains."
        },
        {
          heading: "Elixir",
          text: "Choobio's backend service is written in Elixir. It's an OTP app that is fault tolerant, with each station & line handled in its own supervised process that can fall over and be restarted elegantly."
        },
        {
          heading: "React",
          text: "The frontend of Choobio is a React app hosted on Amazon S3. The React app uses the material-ui library and follows Google's Material Design principles."
        },
        {
          heading: "A Progressive Web App",
          text: "Choobio is a Progressive Web App that has offline functionality using IndexedDB, Service Workers, App Manifests and more. On Android, it can be installed and used as if it were a native application."
        }
      ].to_json,
      link_1_name: "Backend Repo",
      link_1: "https://github.com/joshvince/choobio",
      link_2_name: "Frontend Repo",
      link_2: "https://github.com/joshvince/choobio-web"
    }

    trx = {
      slug: "trx",
      name: "TRX",
      job: true,
      subtitle: "worked here from 2015 to 2018",
      tagline: "An innovative app for the buying and selling of TV rights around the world",
      description: [
        {
          heading: "A B2B app for the TV industry",
          text: "TRX was conceived by experienced TV execs who wanted to bring efficiency and simplicity to the world of TV licensing. Distributors and Broadcasters around the world used TRX to negotiate and complete TV rights deals. Channel 4 and Sky invested in the business."
        },
        {
          heading: "Starting from scratch",
          text: "I was lucky enough to join TRX at the very beginning. During the initial phase of the project I assisted with research and scoping tasks. In January 2016, I was made Product Manager and I worked with the team for the following two years overseeing the initial release and adoption by some of the biggest companies in the world of TV."
        },
        {
          heading: "User Experience",
          text: "During my time at TRX my main role was to find out the right product we had to build for our users. I'm proud of the User Experience I had a hand in creating, and I think TRX is going to change the industry. I moved on in February 2018."
        }
      ].to_json,
      link_1_name: "The business closed down in 2021. It sort of lives on as Rocket Rights",
      link_1: "https://rocketrights.tv"
    }

    peacock = {
      slug: "peacock",
      name: "Peacock",
      job: false,
      subtitle: "created this short film in 2009",
      tagline: "Short film about a egomaniacal film director",
      description: [
        {
          heading: "A short film at uni",
          text: "I did scriptwriting at uni, so it felt fine to make short films instead of doing essays. This was one that I created with some friends, we made it on a shoestring in 2009."
        },
        {
          heading: "Comedy",
          text: "This was our attempt at paying homage to (copying) things like The Office and Arrested Development. I loved making it and although it won't win any awards I'm proud of us for making it ourselves."
        }
      ].to_json,
      link_1_name: "You can watch it here",
      link_1: "https://vimeo.com/19411856"
    }

    killing_bill_gates = {
      slug: "killing-bill-gates",
      name: "Killing Bill Gates",
      job: false,
      subtitle: "directed this play in 2011",
      tagline: "Play about well-intentioned idiots trying to unlock Gates' fortune",
      description: [
        {
          heading: "A play at the Edinburgh Fringe",
          text: "To avoid having to do any real work on work experience, my friends and I put on a play at the Edinburgh Fringe. I directed it which meant I had to do even less work during the festival."
        },
        {
          heading: "Edinburgh",
          text: "The group of us lived together in Edinburgh for a month. It was a great laugh. The play was about nutters plotting to kill Bill Gates to free up his charity money. It recieved a few fairly shitty reviews, which were probably about right."
        }
      ].to_json,
      link_1_name: "Here's the only review I could find",
      link_1: "https://threeweeksedinburgh.com/article/ed2011-theatre-review-killing-bill-gates-free-mechanical-tiger-productions/"
    }

    projects = [carwow, zencargo, howmanymeetings, wedding, bowie, choobio, trx, killing_bill_gates, peacock ]

    ActiveRecord::Base.transaction do
      projects.each_with_index do |project, index|
        obj = Project.find_or_initialize_by(slug: project[:slug]).update!(**project.merge(index: index))
        puts "Adding #{project[:name]}"
      end
    end
  end
end
