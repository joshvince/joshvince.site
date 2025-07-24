# Josh Vince personal site

This is my personal website. It's available at [joshvince.site](https://joshvince.site).

There's nothing particularly interesting here - I'm writing this mostly for future-me who has forgotten and needs to make a change.

The site is a vanilla **Rails** app. The database for the main site is **Postgres**. It uses **erb** for the view templates and **Tailwind** for CSS. There is a sprinkling of **Stimulus** for the mobile menu.

## Blog
I've created a simple markdown CMS for blog posts. The library is [redcarpet](https://github.com/vmg/redcarpet). I've created a custom markdown renderer that injects the tailwind styles into the generated-HTML, which is in `app/helpers/blog_post_tailwind_renderer.rb`.

### To publish a new post
First, create a new markdown file inside `lib/assets/blog_posts`. The file name scheme is `yyyy_mm_dd_name_of_post.md` - this will be used as the slug for the blog so make sure it's url-compliant. You'll need to push this up to the server.

Next, run the rake task `rake blog_posts:publish` on the production box (`bin/kamal shell`) and enter the various prompts.

This will create a record in the `BlogPosts` table, the markdown will be stored as a big old text column in the record, alongside some structured information.

You should be able to see the new post at `/blog/your_file_name`.

## Projects
These are managed via a simple `projects` table which contains structured columns for things like the name and tagline, and a JSON-field for the paragraphs on the info page. Check out the projects model for how these are parsed from JSON into views.

### Creating or updating projects
These records are created and updated by running the `/lib/tasks/projects/create_projects.rake` task (run `rake projects:create`). I run this manually from the production box, it's not automatic. See the deployment section for more info. There's currently no way to delete a project.

### Annotating the models
The annotate gem is used to annotate the files if you change the schema. Run `bundle exec annotate --models` to generate the annotations.

## Deployment
It's hosted on Hetzner.

### Toy projects
My smaller side projects (like this one, and [ISCORA](https://github.com/joshvince/carb)) are all hosted on the same server and **share the same Database container** as this 'main' toy project.

### Setting up a new toy project in the same DB container
Setting up a new toy project is quite easy. I am currently using Kamal to handle deployments, which means you need to point kamal to the right server using the IP address in [deploy.yml](/config/deploy.yml) and handle DNS separately (or you can use a subdomain of joshvince.site).

Then, to share the DB you just need to use the right database URL which uses the schema `postgresql://user:password@josh-db:5432/your_toy_project_production`. If you want to check other examples, [ISCORA](https://github.com/joshvince/carb) is a good one.

I store the credentials in my 1password and expose them using .env.

### DNS
The DNS is on Cloudflare which proxies requests from joshvince.site to the server instance. Kamal handles the certificates and has a reverse proxy. See Kamal for how this works.
