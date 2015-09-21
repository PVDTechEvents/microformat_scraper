require 'spec_helper'

describe MicroformatScraper::Page do

  subject { described_class.new('http://www.phpvd.com/pages/next') }

  describe '#content', :vcr do
    it 'fetches the body content from the EOL Club homepage' do
      expect( subject.content ).to include( 'Product Hunt Providence' )
    end
  end

end
