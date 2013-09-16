module HomeHelper

  def social_share_description(content)
    extra_meta = "... #quotezip "
    offsetLength = extra_meta.length + 2 + request.original_url.length #TODO : 2 is for the space and colon !! make a pr
    maxLength = 140 - offsetLength

    result = content + extra_meta
    result = content[0..maxLength] + extra_meta unless content.length < maxLength
  end

  def social_share_button_tag(quote)
    content = social_share_description quote.content
    url = request.protocol + request.host + "/" + quote.id
    super(result, {url: url})
  end
end
