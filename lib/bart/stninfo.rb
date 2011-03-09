require 'nokogiri'
require 'bart/station'

module Bart
  class StnInfo

    #  attr_reader :destination, :estimates
    attr_reader :lat, :long, :n_routes, :s_routes, :n_pf, :s_pf, :full_addr

    def initialize(xml)
      document  = Nokogiri::XML.parse(xml)
      abbr      = document.css('abbreviation').text
      estimates = document.css('estimate')

      @destination = Station.new(abbr)
      @estimates   = estimates.inject([]) { |memo, i| memo << Estimate.new(i.to_s) }
    end

  end
end
