require 'pry'
class Startup

    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []
    def initialize(founder, name, domain) 
        @founder = founder
        @name = name
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        @@all.find do |s|
            if s.founder == founder
                s
            end
        end
    end

    def self.domains
        @@all.map do |s|
            s.domain
        end
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def sign_contract(vc_obj, type, amount)
        FundingRound.new(self, vc_obj, type, amount.to_f)
    end

    # Startup#total_funds
    # Returns the total sum of investments that the startup has gotten
    def total_funds
        total = 0
        FundingRound.all.each do |s|
            if s.startup == self
                total += s.investment
            end
        end
        total
    end
    

    # Startup#num_funding_rounds
    # Returns the total number of funding rounds that the startup has gotten
    def num_funding_rounds
        total = 0 # 2
        FundingRound.all.each do |s|
            if s.startup == self
                total += 1
            end
        end
        total
    end


    # Startup#investors
    # Returns a unique array of all the venture
    # capitalists that have invested in this company
    def investors
        arr = []
        FundingRound.all.map do |s|
                arr << s.venture_capitalist.name    
        end
        arr.uniq
    end

    # Startup#big_investors
    # Returns a unique array of all the venture capitalists that
    # have invested in this company and are in the Trés Commas club

    def big_investors
        arr = []
        FundingRound.all.map do |s|
            if s.venture_capitalist.total_worth > 1000000000
                arr << s.venture_capitalist.name    
            end
        end
        arr.uniq
    end


# (1..10).detect         { |i| i % 5 == 0 && i % 7 == 0 }   #=> nil
# (1..10).find           { |i| i % 5 == 0 && i % 7 == 0 }   #=> nil
end

# startup_one.investors
# startup_one.num_funding_rounds
# startup_one.total_funds
# FundingRound.all
# startup_one.big_investors














