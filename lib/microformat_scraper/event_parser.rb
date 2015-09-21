require 'microformat_scraper/event'
require 'nokogiri'

module MicroformatScraper

  class EventParser

    # This method is extremely fragile, but so far EOLclub.org has been sticking to
    # the same format, so that may be okay.
    def parse(content)
      doc = Nokogiri::HTML.parse(content)
      doc.css('.vevent').map{|elem| parse_event(elem)}
    end

    private

    def parse_event(elem)
      summary = mf_value(elem, '.summary')

      description = elem.css('.description').map(&:to_html).join

      start_time = mf_value(elem, '.dtstart')
      end_time = mf_value(elem, '.dtend')

      Event.new(
        start_time: start_time,
        end_time: end_time,
        description: description,
        summary: summary,
      )
    end

    def mf_value(elem, css_path)
      el = elem.css(css_path).first
      if attr = el.attributes['title']
        attr.value
      else
        el.text
      end
    end

  end

end
