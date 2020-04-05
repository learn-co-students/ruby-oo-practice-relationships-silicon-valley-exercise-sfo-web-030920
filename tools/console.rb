require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# startup_one.num_funding_rounds
#################################################################
startup_one = Startup.new("mike","Blizzard","Blizz_domain")

startup_two = Startup.new("Dave","EA","EA_domain")

startup_three = Startup.new("mike","Riots","Riots_domain")

startup_four = Startup.new("Mac","Ubisoft","Ubisoft_domain")
#################################################################
dona = VentureCapitalist.new("Dona", 1000000)

april = VentureCapitalist.new("April", 2000000000)

arthas = VentureCapitalist.new("Arthas", 7000000000)
#################################################################
# (startup, venture_capitalist, type, investment)
first = FundingRound.new(startup_one, dona, "Series A", 1000.0)
second = FundingRound.new(startup_two, april, "Series B", 2000.0)
third = FundingRound.new(startup_three, arthas, "Series C", 3000.0)
fourth = FundingRound.new(startup_one, arthas, "Series C", 4000.0)
five = FundingRound.new(startup_one, arthas, "Series R", 9000.0)

#################################################################

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line


# attr_reader :founder, :domain
# @@all = []
# def initialize(founder, name, domain) 
#     @founder = founder
#     @name = name
#     @domain = domain
#     @@all << self
# end