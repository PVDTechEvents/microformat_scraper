require 'spec_helper'

describe MicroformatScraper::EventParser do

  describe '#parse' do
    let(:parsed) { subject.parse(content) }

    let(:timezone_offset) { 4 * 60 * 60 }

    it 'parses Events from the supplied content' do
      expect( parsed.count ).to eq( 1 )

      event = parsed.first
      expect( event.start_time ).to eq( Time.utc(2015, 9, 29, 18, 0, 0) + timezone_offset )
      expect( event.end_time ).to eq( Time.utc(2015, 9, 29, 20, 0, 0) + timezone_offset )
    end

    it 'provides the HTML description from the scraped page' do
      desc = parsed.first.description
      expect(desc).to include("4 exceptional demos this month")
    end
  end

  let(:content) {
    <<-EOF
      <!DOCTYPE html>
      <html>
      <head>
        <title>Product Hunt Providence Meetup</title>
      </head>
      <body>
      <span class="vevent">
      <span class="summary" style="display:none">Ginger, Furniture, Maker</span>
      <span class="location" style="display:none">150 Union St, Loft 606</span>
      <span class="description" style="display:none">Product Hunt Providence returns for an evening of awesome physical and digital products. Free beer and pizza sponsored by Splitwise. Join us next Tuesday evening (9/29) for the return of PRODUCT HUNT PROVIDENCE at a new location: 150 Union St, Loft 606, Providence RI 02903. Between Westminster and Washington. 

      4 exceptional demos this month:
        - Greycork: John's claims you can build Greycork furniture in 5 minutes. They've raised a record-breaking $244,633 on IndieGogo 
      - Farmer Willie's: Max Easton, Brown University student, shows off his team's delicious alcoholic ginger beer 
      - Tinkering: Angie Callau from Make Media will be demoing the coolest projects built from the book 
      - Motel: Caleb Oller will demo a client project, a Pebble Watch app that helps autistic children manage routine tasks. 

        Please RSVP at http://www.phpvd.com/pages/next.

        </span>
        <span class="location" style="display:none">To be determined</span>
        <span class="dtstart" style="display:none">2015-09-29 18:00-0400</span>
        <span class="dtend" style="display:none">2015-09-29 20:00-0400</span>
        <span style="display:none" class="url">http://www.phpvd.com/pages/next
        </span>
        </span>
      </body>
      </html>
    EOF
  }

end
