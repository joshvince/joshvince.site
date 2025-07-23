# Josh Vince personal site

This is my personal website. It's available at [joshvince.site](https://joshvince.site).

There's nothing particularly interesting here - I'm writing this mostly for future-me who has forgotten and needs to make a change.

The site is a vanilla **Rails** app. The database for the main site is **Postgres**. It uses **erb** for the view templates and **Tailwind** for CSS. There is a sprinkling of **Stimulus** for the mobile menu, mostly created as an experiment in doing something interactive that wasn't React.

## Blog
I've created a simple markdown CMS for blog posts. The library is [redcarpet](https://github.com/vmg/redcarpet). I've created a custom markdown renderer that injects the tailwind styles into the generated-HTML, which is in `app/helpers/blog_post_tailwind_renderer.rb`.

### To publish a new post
First, create a new markdown file inside `lib/assets/blog_posts`. The file name scheme is `yyyy_mm_dd_name_of_post.md` - this will be used as the slug for the blog so make sure it's url-compliant. You'll need to push this up to the server.

Next, run the rake task `rake blog_posts:publish` on the production box (you'll need an interactive session with something like `railway shell` for this to work) and enter the various prompts.

This will create a record in the `BlogPosts` table, the markdown will be stored as a big old text column in the record, alongside some structured information.

You should be able to see the new post at `/blog/your_file_name`.

## Projects
These are managed via a simple `projects` table which contains structured columns for things like the name and tagline, and a JSON-field for the paragraphs on the info page. Check out the projects model for how these are parsed from JSON into views.

### Creating or updating projects
These records are created and updated by running the `/lib/tasks/projects/create_projects.rake` task (run `rake projects:create`). I run this manually from the production box, it's not automatic. See the deployment section for more info. There's currently no way to delete a project.

### Annotating the models
The annotate gem is used to annotate the files if you change the schema. Run `bundle exec annotate --models` to generate the annotations.

## Deploying
It's hosted on [Railway](https://railway.app). Railway handles the postgres instance and the server box as well as the environment variables that Rails needs. Deploying is handled automatically with pushes to the `main` branch but you can also trigger a deploy with `railway up` if the CLI is installed and the project is linked. Check the docs on Railway for more on how this works.

### DNS
Check out Railway for how this works - the DNS is on Cloudflare which proxies requests from joshvince.site to the server instance. Railway/Cloudflare also manage the SSL certs.
