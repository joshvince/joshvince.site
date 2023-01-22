namespace :blog_posts do
  desc 'Publish a blog post'
  task :publish => :environment do |_args|
    # Grab the file path
    puts 'Enter the file name (must be inside lib/blog_posts) 👇🏼'
    user_filepath = STDIN.gets.chomp

    # Check if there's a post that already exists with that slug
    blog_post = BlogPost.find_or_initialize_by(slug: File.basename(user_filepath, '.*'))
    puts "\nHere's the current entry by that slug in the DB"
    puts "\n#{blog_post.attributes}\n===========================\n\n"
    puts "Do you want to continue? [y/n]"
    user_confirmation = STDIN.gets.chomp.downcase
    return unless user_confirmation === 'y'

    # Convert it to markdown
    file_contents = File.read("lib/blog_posts/#{user_filepath}")
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown_content = markdown.render(file_contents)

    # Check it looks OK
    puts "\n\n===========================\n\n#{markdown_content}\n\n===========================\n\n"
    puts 'Does the contents look OK? Only raw markdown will be stored [y/n]'
    user_confirmation = STDIN.gets.chomp.downcase
    return unless user_confirmation === 'y'

    blog_post.markdown_content = file_contents

    # Grab the title
    puts "\nEnter the post's title"
    user_title = STDIN.gets.chomp

    blog_post.title = user_title

    # Grab the subtitle
    puts "\nEnter the post's subtitle"
    user_subtitle = STDIN.gets.chomp

    blog_post.subtitle = user_subtitle

    # Grab the published date
    puts "\nEnter the post's published date (leave blank for today)"
    input = STDIN.gets.chomp.downcase
    user_date = input.blank? ? Date.today : Date.parse(input)

    blog_post.published_on = user_date

    puts "\nHere's what is going to be saved"
    puts "\n#{blog_post.attributes}\n===========================\n\n"
    puts "Do you want to save? [y/n]"
    user_confirmation = STDIN.gets.chomp.downcase
    return unless user_confirmation === 'y'

    blog_post.save!

    puts "Saved"
    puts blog_post.reload.attributes
  end
end
