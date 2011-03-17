require 'nokogiri'

module Bart
  class Estimate

    attr_reader :minutes, :platform, :direction, :length

    def initialize(xml)
      document = Nokogiri::XML.parse(xml)

      @minutes   = document.css('minutes').text.to_i 
      @platform  = document.css('platform').text.to_i
      @direction = document.css('direction').text
      @length    = document.css('length').text.to_i
    end

    def zero_means_arriving(minutes)
      minutes
    end

    def add_min(minutes)
      minutes = minutes.to_s
      if minutes.match =~ /\d+/
        minutes += ' min '
      end
      minutes
    end

    def seconds
      @minutes * 60
    end

    def time
      Time.now + seconds
    end

  end
end
