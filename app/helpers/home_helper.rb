module HomeHelper
  def social_share_button_content(content)

    return content if content.length < 140

    content[0..136] + "..."
  end
end
