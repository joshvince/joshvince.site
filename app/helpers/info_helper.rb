module InfoHelper
  def feed_item_partial(item)
    case item
    when Project
      if item.standalone?
        ["projects/#{item.slug.tr('-', '_')}_preview", { project: item }]
      else
        ["projects/project_preview", { project: item }]
      end
    when BlogPost
      ["writing/regular_post_preview", { post: item }]
    end
  end
end
