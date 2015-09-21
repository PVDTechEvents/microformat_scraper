require 'spec_helper'

describe MicroformatScraper do
  it 'has a version number' do
    expect(MicroformatScraper::VERSION).not_to be nil
  end

  describe '.scheduled_events(url)' do
    let(:url) { 'http://example.com/' }
    let(:content) { double }
    let(:event) { double }

    before do
      MicroformatScraper::Page.any_instance.stub(:content) { content }
      MicroformatScraper::EventParser.any_instance.stub(:parse).with(content) { [event] }
    end

    it 'parses an Event from the URL' do
      expect(MicroformatScraper.scheduled_events(url)).to eq([event])
    end
  end

end
