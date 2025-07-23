xml.instruct! :xml, version: "1.0"
xml.rss version: "2.0" do
  xml.channel do
    xml.title "Josh Vince"
    xml.description "Articles, stories and other writing by Josh Vince."
    xml.link writing_index_url
    xml.language "en-uk"
    xml.lastBuildDate @posts.first&.published_on&.to_formatted_s(:rfc822)

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.subtitle
        xml.pubDate post.published_on.to_formatted_s(:rfc822)
        xml.link post.url
        xml.guid post.url
      end
    end
  end
end
