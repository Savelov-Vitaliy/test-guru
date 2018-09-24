class ResultObject

  attr_reader :html_url

  def initialize(result)
    @html_url = result.html_url if result.respond_to?(:html_url)
  end

  def success?
    !@html_url.blank?
  end

end
