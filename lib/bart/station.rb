# http://api.bart.gov/docs/etd/etd.aspx uses abbr and abbreviation
# interchangeably. I'm settling on abbr to be both clear and concise.

require 'nokogiri'
require 'bart/etd'
#  require 'etd'
require 'bart/station/list'

# CLEANUP
require 'net/http'
require 'bart/estimate'

module Bart

  class Station

    attr_reader :abbr
    attr_accessor :departures

    # DEBUG
    attr_reader :document

    # OPTIMIZE If we have one station object, we don't need to initialize
    # new ones over and over again. We'll leave it alone for now, for
    # simplicity.
    def initialize(abbr)
      @abbr = abbr.downcase
    end

    def self.from_xml(xml)
      document   = Nokogiri::XML.parse(xml)
      abbr       = document.css('abbr').text
      departures = document.css('etd')

      station = new(abbr)
      station.departures = departures.inject([]) do |memo, i|
        memo << Etd.new(i.to_s)
      end

      station
    end

    def name
      ID_TO_NAME[abbr]
    end

    # fetch
    def load_departures
      params = {
        :cmd => 'etd',
        :orig => @abbr,
        :key => 'MW9S-E7SL-26DU-VV8V'
      }

      query_string = '?' + params.map { |key, value| [key, value] * '=' } * '&'
      ssan_etd = Net::HTTP::Get.new('/api/etd.aspx' + query_string )

      response = Net::HTTP.start('api.bart.gov') do |http|
        http.request(ssan_etd)
      end

      store_departures(response.body)
    end

    def store_departures(xml)
      document = Nokogiri::XML.parse(xml)
      @document = document
      @departures = document.css('etd').inject([]) do |memo, i|
        memo << Etd.new(i.to_s)
      end
    end

    def load_stninfo
      params = {
        :cmd => 'stninfo',
        :orig => @abbr,
        :key => 'MW9S-E7SL-26DU-VV8V',
      }

      query_string = '?' + params.map { |key, value| [key, value] * '=' } * '&'
      ssan_etd = Net::HTTP::Get.new('/api/stninfo.aspx' + query_string )
      
    end

  end
end
