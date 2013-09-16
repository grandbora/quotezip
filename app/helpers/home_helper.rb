module HomeHelper

  def initialize
    @extra_meta = "... #quotezip "
  end

  def social_share_button_content(content)

    offsetLength = @extra_meta.length + 2 + request.original_url.length #TODO : 2 is for the space and colon !! make a pr
    maxLength = 140 - offsetLength

    result = content + @extra_meta
    result = content[0..maxLength] + @extra_meta unless content.length < maxLength
  end

end