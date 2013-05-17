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

  def display(value, empty_value = '-')
    result = value.presence || empty_value
    result.is_a?(Time) ? l(result) : result
  end

  def leveled_title(title, level = 1)
    tag_name = "h#{level}"
    content_tag(tag_name, title)
  end

  def leveled_block(level = 0)
    content_tag(:div, class: "level_#{level}") { yield }
  end
end
