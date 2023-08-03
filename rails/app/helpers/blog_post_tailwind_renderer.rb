class BlogPostTailwindRenderer < Redcarpet::Render::HTML
  def paragraph(text)
    %(<p class="mb-8">#{text}</p>)
  end

  def header(text, header_level)
    case header_level
    when 1
      %(<h1 class="font-black text-6xl my-8">#{text}</h1>)
    when 2
      %(<h2 class="font-black text-4xl text-gray-800 my-8">#{text}</h2>)
    when 3
      %(<h3 class="font-black text-3xl text-gray-800 my-6">#{text}</h3>)
    else
      %(<h4 class="font-black text-2xl text-gray-800 my-4">#{text}</h4>)
    end
  end

  def link(link, _title, content)
    %(<a class="underline" href="#{link}" target="_blank" rel="noreferrer">#{content}</a>)
  end

  def double_emphasis(text)
    %(<strong class="font-bold text-gray-800">#{text}</strong>)
  end

  def image(link, _title, alt_text)
    if link =~ /.mp4/
      video_tag(link, alt_text)
    else
      image_tag(link, alt_text)
    end
  end

  private

  def image_tag(link, alt_text)
    alt = "An image: #{alt_text}"
    %(
      <div class="my-12 w-full flex flex-col justify-center items-center">
        <img class="h-90 md:w-3/5 rounded-md shadow-lg" src="#{link}" alt="#{alt}"/>
        <p class="mt-3 text-sm text-gray-500">#{alt_text}</p>
      </div>
    )
  end

  def video_tag(link, alt_text)
    alt = "A video: #{alt_text}"
    %(
      <div class="my-12 w-full flex flex-col justify-center justify-center items-center">
        <video class="h-90 md:w-3/5 rounded-md shadow-lg" alt="#{alt}" controls>
          <source src="#{link}" type="video/mp4">
        </video>
        <p class="mt-3 text-sm text-gray-500">#{alt_text}</p>
      </div>)
  end
end
