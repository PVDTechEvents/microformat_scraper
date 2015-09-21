require 'virtus'

module MicroformatScraper

  class Event
    include Virtus.model

    attribute :start_time, Time
    attribute :end_time, Time
    attribute :description, String
    attribute :summary, String
  end

end
