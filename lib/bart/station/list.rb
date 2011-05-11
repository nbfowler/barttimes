
module Bart
  class Station

    LIST = [
      { :id => "12th", :name => "12th St. Oakland" },
      { :id => "16th", :name => "16th St. Mission" },
      { :id => "19th", :name => "19th St. Oakland" },
      { :id => "24th", :name => "24th St. Mission" },
      { :id => "ashb", :name => "Ashby" },
      { :id => "balb", :name => "Balboa Park" },
      { :id => "bayf", :name => "Bay Fair" },
      { :id => "cast", :name => "Castro Valley" },
      { :id => "civc", :name => "Civic Center" },
      { :id => "cols", :name => "Coliseum/Oakland Airport" },
      { :id => "colm", :name => "Colma" },
      { :id => "conc", :name => "Concord" },
      { :id => "daly", :name => "Daly City" },
      { :id => "dbrk", :name => "Downtown Berkeley" },
      { :id => "dubl", :name => "Dublin/Pleasanton" },
      { :id => "deln", :name => "El Cerrito del Norte" },
      { :id => "plza", :name => "El Cerrito Plaza" },
      { :id => "embr", :name => "Embarcadero" },
      { :id => "frmt", :name => "Fremont" },
      { :id => "ftvl", :name => "Fruitvale" },
      { :id => "glen", :name => "Glen Park" },
      { :id => "hayw", :name => "Hayward" },
      { :id => "lafy", :name => "Lafayette" },
      { :id => "lake", :name => "Lake Merritt" },
      { :id => "mcar", :name => "MacArthur" },
      { :id => "mlbr", :name => "Millbrae" },
      { :id => "mont", :name => "Montgomery St." },
      { :id => "nbrk", :name => "North Berkeley" },
      { :id => "ncon", :name => "North Concord/Martinez" },
      { :id => "orin", :name => "Orinda" },
      { :id => "pitt", :name => "Pittsburg/Bay Point" },
      { :id => "phil", :name => "Pleasant Hill" },
      { :id => "powl", :name => "Powell St." },
      { :id => "rich", :name => "Richmond" },
      { :id => "rock", :name => "Rockridge" },
      { :id => "sbrn", :name => "San Bruno" },
      { :id => "sfia", :name => "San Francisco Int'l Airport" },
      { :id => "sanl", :name => "San Leandro" },
      { :id => "shay", :name => "South Hayward" },
      { :id => "ssan", :name => "South San Francisco" },
      { :id => "ucty", :name => "Union City" },
      { :id => "wcrk", :name => "Walnut Creek" },
      { :id => "wdub", :name => "West Dublin/Pleasanton" },
      { :id => "woak", :name => "West Oakland" }
    ]

    ID_TO_NAME = LIST.inject({}) { |memo, i| memo[i[:id]] = i[:name]; memo }

  end
end
