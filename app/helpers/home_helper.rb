module HomeHelper

  @extra_meta = "... #quotezip "

  def social_share_button_content(content)

    offsetLength = @extra_meta.length + 2 + request.original_url.length #TODO : 2 is for the space and colon !! make a pr
    maxLength = 140 - offsetLength

    return content + @extra_meta if content.length < maxLength

    content[0..maxLength] + @extra_meta
  end

end