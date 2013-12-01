module FeedHelper
  def social_share_description(quote)
    content = quote.content
    extra_meta = "... #quotezip "
    offsetLength = extra_meta.length + 2 + get_url(quote).length #2 is for the space and colon
    maxLength = 140 - offsetLength

    (content.length < maxLength ? content : content[0..maxLength - 1]) + extra_meta
  end

  def social_share_button_tag(quote)
    content = social_share_description quote
    url = get_url(quote)
    super(content, {url: url})
  end

  private
  def get_url(quote)
    request.protocol + request.host + "/" + quote.id.to_s
  end
end
