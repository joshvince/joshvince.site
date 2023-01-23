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
    %(<a class="underline" href="#{link}">#{content}</a>)
  end

  def double_emphasis(text)
    %(<strong class="font-bold text-gray-800">#{text}</strong>)
  end

  def image(link, _title, alt_text)
    %(<img class="my-4" src="#{link}" alt="#{alt_text}"/>)
  end
end
