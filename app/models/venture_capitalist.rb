class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        @@all.select do |s|
            if s.total_worth > 1000000000
               s 
            end
        end
    end

    # VentureCapitalist#offer_contract
    # given a startup object, type of investment (as a string),
    # and the amount invested (as a float),
    # creates a new funding round and associates it with that
    # startup and venture capitalist.
    def offer_contract(startup, type, amount)
        FundingRound.new(startup, self, type, amount.to_f)
    end
    #  initialize(startup, venture_capitalist, type, investment)

    # VentureCapitalist#funding_rounds
    # returns an array of all funding rounds for that venture capitalist
    def funding_rounds
        FundingRound.all.select do |s|
             s.venture_capitalist == self
        end
    end

    # VentureCapitalist#portfolio
    # Returns a unique list of all startups this venture capitalist has funded
    def portfolio
        arr = []
        FundingRound.all.select do |s|
            if s.venture_capitalist == self
                arr << s.startup.name
            end
        end
        arr.uniq
    end

    # VentureCapitalist#biggest_investment
    # returns the largest funding round given by this venture capitalist
    def biggest_investment
        arr = []
        FundingRound.all.select do |s|
            if s.venture_capitalist == self
                arr << s.investment
            end
        end
        arr.max
    end

    # VentureCapitalist#invested
    # given a domain string, returns the total amount invested in that domain
    def invested(web)
        arr = []
        funding_rounds.select do |s|
            if s.startup.domain == web
                arr << s.investment
            end
        end
        arr.sum
    end





end
    # dona.offer_contract(startup_two, "Series X", 9000)

    #     def sign_contract(vc_obj, type, amount)
    #         FundingRound.new(self, vc_obj, type, amount.to_f)
    #     end
#############################
        # Startup#sign_contract
        # given a venture capitalist object, type of investment 
        # (as a string), and the amount invested (as a float),
        # creates a new funding round and associates it with that startup and venture capitalist.












