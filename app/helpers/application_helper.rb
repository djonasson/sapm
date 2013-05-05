module ApplicationHelper
  def title(page_title, page_subtitle='')
    safe_title = h(page_title.to_s)
    safe_subtitle = h(page_subtitle.to_s)
    content_for(:title) { "#{safe_title} #{safe_subtitle}" }
    content_tag(:h1, safe_title + (safe_subtitle.empty? ? '' : raw(' '  + content_tag(:small, safe_subtitle))))
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
end
