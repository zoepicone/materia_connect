module ApplicationHelper
  include Pagy::Frontend

  def markdown(text)
    options = {
      filter_html: true,
      link_attributes: { rel: 'nofollow', target: '_blank' },
      no_images: true,
      no_styles: true,
      safe_links_only: true
    }

    extensions = {
      autolink: true,
      superscript: true,
      disable_indented_code_blocks: true,
      strikethrough: true,
      underline: true,
    }

    renderer = Redcarpet::Render::XHTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end
