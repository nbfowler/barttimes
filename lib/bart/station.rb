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
        :key => 'MZHM-BLID-IBJ5-95DS'
      }

      query_string = '?' + params.map { |key, value| [key, value] * '=' } * '&'

      host = 'http://api.bart.gov'

      path_query_str = '/api/etd.aspx' + query_string

      response = fetch(host, path_query_str)

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

    protected

      def fetch(host, path_query_str, limit = 10)
        response = Net::HTTP.get_response(URI.parse(host + path_query_str))
        case response
        when Net::HTTPSuccess     then response
        when Net::HTTPRedirection then fetch(host, response['location'], limit - 1)
        else
          response.error!
        end
      end
  end
end
