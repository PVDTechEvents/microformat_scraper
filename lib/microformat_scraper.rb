require "microformat_scraper/version"
require "microformat_scraper/page"
require "microformat_scraper/event_parser"

module MicroformatScraper

  def self.scheduled_events(url)
    page = Page.new(url)
    parser = EventParser.new
    parser.parse(page.content)
  end

end
