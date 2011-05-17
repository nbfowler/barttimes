
A simple mobile web app using jish's ruby wrapper [http://github.com/jish/bart](http://github.com/jish/bart) around the BART API. [http://api.bart.gov/](http://api.bart.gov/)

##Mobile app URL

[http://barttimes.com](http://barttimes.com)

## Ruby Wrapper Usage

Create a new station object

    require 'bart/station'

    station = Bart::Station.new('ssan')
    station.name
    # => "South San Francisco"

And see when then next trains are supposed to arrive

    station.load_departures
    station.departures.map do |d|
      [d.destination.name, d.estimates.map { |e| e.minutes }]
    end
    # => [["Pittsburg/Bay Point", [5, 25, 50]], ["Millbrae", [5, 25, 46]]]

_NOTE: This is still beta software. All public APIs are subject to change_
