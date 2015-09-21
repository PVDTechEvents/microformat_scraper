require 'open-uri'

module MicroformatScraper

  class Page
    def initialize(url)
      @url = url
    end

    def content
      open(@url).read
    end
  end

end
