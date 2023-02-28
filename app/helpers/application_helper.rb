module ApplicationHelper
  include Pagy::Frontend

  def controller_action_name = "#{controller_name}##{action_name}"

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

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::XHTML.new(options), extensions)
    markdown.render(text).html_safe
  end
end
